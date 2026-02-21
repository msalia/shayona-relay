use crate::server::AppState;
use axum::{extract::State, http::StatusCode, response::IntoResponse, Json};
use mysql::prelude::*;
use serde::{Deserialize, Serialize};
use serde_json::json;
use std::sync::Arc;

#[derive(Deserialize)]
pub struct SalesRequest {
    pub date: String,
}

#[derive(Deserialize)]
pub struct StatsRequest {
    #[serde(rename = "dateStart")]
    pub date_start: String,
    #[serde(rename = "dateEnd")]
    pub date_end: String,
}

#[derive(Serialize)]
pub struct StatsResponse {
    #[serde(rename = "totalOrders")]
    pub total_orders: i64,
    #[serde(rename = "totalIncome")]
    pub total_income: f64,
    #[serde(rename = "totalGuests")]
    pub total_guests: i64,
}

pub async fn post_stats(
    State(state): State<Arc<AppState>>,
    Json(payload): Json<StatsRequest>,
) -> impl IntoResponse {
    // grab a connection from the mysql pool
    let mut conn = state.pool.get_conn().unwrap();

    // use the same SQL that the original node handler ran
    let query = format!(
        "SELECT count(t.CheckID) AS Checks,
            SUM(t.Covers) AS GuestCount,
            SUM(t.Payment) AS Total
        FROM (
            SELECT DISTINCT
                c.CheckID,
                c.Covers,
                c.Payment
            FROM checks c
            LEFT JOIN check_detail cd ON c.CheckID = cd.CheckID
            WHERE c.CheckClose >= '{}'
                AND c.CheckClose < '{}'
                AND c.SubTotal IS NOT NULL
                AND c.SubTotal >= 0.0
                AND cd.DetailType = 4
                AND cd.ObjectNumber != 99
        ) AS t",
        payload.date_start, payload.date_end
    );

    match conn.query_first::<mysql::Row, std::string::String>(query) {
        Ok(Some(row)) => {
            // extract the values, defaulting to zero if anything is NULL
            let checks: i64 = row.get_opt("Checks").and_then(|res| res.ok()).unwrap_or(0);
            let guests: i64 = row
                .get_opt("GuestCount")
                .and_then(|res| res.ok())
                .unwrap_or(0);
            let total: f64 = row.get_opt("Total").and_then(|res| res.ok()).unwrap_or(0.0);

            let stats = StatsResponse {
                total_orders: checks,
                total_income: total,
                total_guests: guests,
            };

            (StatusCode::OK, Json(stats))
        }
        Ok(None) => {
            // no row returned; just send zeros
            let stats = StatsResponse {
                total_orders: 0,
                total_income: 0.0,
                total_guests: 0,
            };
            (StatusCode::OK, Json(stats))
        }
        Err(e) => {
            eprintln!("Database error: {:?}", e);
            let stats = StatsResponse {
                total_orders: 0,
                total_income: 0.0,
                total_guests: 0,
            };
            (StatusCode::INTERNAL_SERVER_ERROR, Json(stats))
        }
    }
}

pub async fn post_sales(
    State(state): State<Arc<AppState>>,
    Json(payload): Json<SalesRequest>,
) -> impl IntoResponse {
    let mut conn = state.pool.get_conn().unwrap();
    let query = format!(
        "select
            detail.ObjectNumber as MenuItemId,
            sum(detail.SalesCount) as Total
        from check_detail as detail
        where detail.ObjectNumber is not null
            and detail.ObjectNumber not in (1, 100, 20)
            and datediff(detail.DetailPostingTime, '{}') = 0
        group by detail.ObjectNumber",
        payload.date
    );

    // build a dynamic map similar to the JavaScript version
    let mut sales_counts = serde_json::Map::new();
    match conn.query_iter(query) {
        Ok(mut result) => {
            while let Some(Ok(row)) = result.next() {
                let menu_item_id: Option<i64> = row.get("MenuItemId");
                let total: Option<i64> = row.get("Total");
                if let (Some(menu_item_id), Some(total)) = (menu_item_id, total) {
                    sales_counts.insert(menu_item_id.to_string(), json!(total));
                }
            }
        }
        Err(e) => {
            eprintln!("Database error: {:?}", e);
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({ "salesCounts": {} })),
            );
        }
    };

    (StatusCode::OK, Json(json!({ "salesCounts": sales_counts })))
}
