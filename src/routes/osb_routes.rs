use crate::server::AppState;
use axum::{extract::State, http::StatusCode, response::IntoResponse, Json};
use mysql::prelude::*;
use serde::Deserialize;
use serde_json::json;
use std::sync::Arc;

#[derive(Deserialize)]
pub struct OSBRequest {
    #[serde(rename = "orderDeviceIds")]
    pub order_device_ids: Vec<i16>,
    #[serde(rename = "lastN")]
    pub last_n: i64,
}

pub async fn post_osb(
    State(state): State<Arc<AppState>>,
    Json(payload): Json<OSBRequest>,
) -> impl IntoResponse {
    // grab a connection from the mysql pool
    let mut conn = state.clone().pool.get_conn().unwrap();

    // build comma-separated device id list for SQL
    let id_list = payload
        .order_device_ids
        .iter()
        .map(|id| id.to_string())
        .collect::<Vec<_>>()
        .join(", ");

    let query = format!(
        "SELECT
            checks.CheckNumber
        FROM kds_detail AS detail
        RIGHT JOIN checks AS checks
            ON checks.CheckID = detail.CheckID
        WHERE detail.OrderDeviceIndex IN ({})
        ORDER BY detail.SentTime DESC LIMIT {}",
        id_list, payload.last_n
    );

    let mut completed_numbers: Vec<i64> = Vec::new();
    match conn.query_iter(query) {
        Ok(mut result) => {
            while let Some(Ok(row)) = result.next() {
                let check_number: Option<i64> = row.get_opt("CheckNumber").and_then(|res| res.ok());
                if let Some(num) = check_number {
                    completed_numbers.push(num);
                }
            }
        }
        Err(e) => {
            eprintln!("Database error: {:?}", e);
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({ "completedCheckNumbers": [] })),
            );
        }
    }

    (
        StatusCode::OK,
        Json(json!({ "completedCheckNumbers": completed_numbers })),
    )
}
