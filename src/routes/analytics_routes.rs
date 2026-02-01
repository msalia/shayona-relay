use crate::database::schema::{check_detail, checks};
use crate::server::AppState;
use axum::{extract::State, http::StatusCode, response::IntoResponse, Json};
use diesel::dsl::sum;
use diesel::prelude::*;
use serde::{Deserialize, Serialize};
use serde_json::json;
use std::collections::HashMap;
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
    let conn = state.pool.get_conn().unwrap();

    let date_start: &str = payload.date_start.as_str();
    let date_end: &str = payload.date_end.as_str();

    // Query checks with their details, filtering by date and detail type
    let results: Result<Vec<(i64, Option<i32>, Option<f64>)>, diesel::result::Error> =
        checks::table
            .left_join(check_detail::table.on(checks::CheckID.eq(check_detail::CheckID)))
            .filter(checks::CheckClose.ge(date_start))
            .filter(checks::CheckClose.lt(date_end))
            .filter(checks::SubTotal.is_not_null().ge(0.0))
            .filter(check_detail::DetailType.eq(4))
            .filter(check_detail::ObjectNumber.ne(99))
            .select((checks::CheckID, checks::Covers, checks::Payment))
            .distinct()
            .load::<(i64, Option<i32>, Option<f64>)>(&mut conn);

    match results {
        Ok(records) => {
            let total_orders = records.len() as i64;
            let total_guests = records
                .iter()
                .filter_map(|(_, covers, _)| covers.map(|c| c as i64))
                .sum();
            let total_income = records
                .iter()
                .filter_map(|(_, _, payment)| payment.ok())
                .sum();

            let stats: StatsResponse = StatsResponse {
                total_orders,
                total_income,
                total_guests,
            };

            (StatusCode::OK, Json(stats))
        }
        Err(e) => {
            eprintln!("Database error: {:?}", e);
            (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(StatsResponse {
                    total_orders: 0,
                    total_income: 0.0,
                    total_guests: 0,
                }),
            )
        }
    }
}

pub async fn post_sales(
    State(state): State<Arc<AppState>>,
    Json(payload): Json<SalesRequest>,
) -> impl IntoResponse {
    let conn = state.pool.get_conn().unwrap();

    // Query check_detail grouped by ObjectNumber
    let results: Result<Vec<(Option<i32>, Option<i32>)>, diesel::result::Error> =
        check_detail::table
            .filter(check_detail::ObjectNumber.is_not_null())
            .filter(check_detail::ObjectNumber.ne_all(vec![1, 100, 20]))
            .select((check_detail::ObjectNumber, sum(check_detail::SalesCount)))
            .group_by(check_detail::ObjectNumber)
            .load::<(Option<i32>, Option<i32>)>(&mut conn);

    match results {
        Ok(records) => {
            let mut sales_counts: HashMap<i32, i32> = HashMap::new();

            for (object_number, sales_count) in records {
                if let (Some(obj_num), Some(count)) = (object_number, sales_count) {
                    sales_counts.insert(obj_num, count);
                }
            }

            (StatusCode::OK, Json(json!({ "salesCounts": sales_counts })))
        }
        Err(e) => {
            eprintln!("Database error: {:?}", e);
            (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({ "salesCounts": {} })),
            )
        }
    }
}
