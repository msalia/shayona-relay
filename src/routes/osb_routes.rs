use crate::database::schema::{checks, kds_detail};
use crate::server::AppState;
use axum::{extract::State, http::StatusCode, response::IntoResponse, Json};
use diesel::prelude::*;
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
    let conn = state.pool.get_conn().unwrap();

    let order_device_ids = payload.order_device_ids.clone();
    let last_n = payload.last_n;

    // Query: kds_detail inner join checks filtering by OrderDeviceIndex
    let results: Result<Vec<i32>, diesel::result::Error> = kds_detail::table
        .inner_join(checks::table.on(checks::CheckID.eq(kds_detail::CheckID)))
        .filter(kds_detail::OrderDeviceIndex.eq_any(order_device_ids))
        .select(checks::CheckNumber)
        .order_by(kds_detail::SentTime.desc())
        .limit(last_n)
        .load::<i32>(&mut conn);

    match results {
        Ok(check_numbers) => (
            StatusCode::OK,
            Json(json!({ "completedCheckNumbers": check_numbers })),
        ),
        Err(e) => {
            eprintln!("Database error: {:?}", e);
            (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({ "completedCheckNumbers": [] })),
            )
        }
    }
}
