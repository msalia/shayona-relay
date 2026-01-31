use std::sync::Arc;

use axum::{extract::State, http::StatusCode, response::IntoResponse, Json};
use diesel::prelude::*;
use serde::{Deserialize, Serialize};
use serde_json::json;

use crate::database::schema::{check_detail, checks};
use crate::server::AppState;

#[derive(Deserialize)]
pub struct ChecksToExportRequest {
    #[serde(rename = "dateStart")]
    pub date_start: String,
    #[serde(rename = "dateEnd")]
    pub date_end: String,
    #[serde(rename = "ignoreObjectNumber")]
    pub ignore_object_number: i32,
}

#[derive(Serialize)]
pub struct ExportedCheck {
    #[serde(rename = "checkNumber")]
    pub check_number: i32,
    #[serde(rename = "sequenceNumber")]
    pub sequence_number: i64,
    #[serde(rename = "checkTotal")]
    pub check_total: f64,
    #[serde(rename = "subTotal")]
    pub sub_total: f64,
    #[serde(rename = "taxTotal")]
    pub tax_total: Option<f64>,
    #[serde(rename = "guestCount")]
    pub guest_count: i32,
    #[serde(rename = "revenueCenterID")]
    pub revenue_center_id: Option<i32>,
}

pub async fn post_checks_to_export(
    State(state): State<Arc<AppState>>,
    Json(payload): Json<ChecksToExportRequest>,
) -> impl IntoResponse {
    let conn = state.pool.get_conn().unwrap();

    let date_start: &str = payload.date_start.as_str();
    let date_end: &str = payload.date_end.as_str();
    let ignore_obj_num: i32 = payload.ignore_object_number;

    // Query checks with their details
    let results: Result<
        Vec<(
            i32,
            String,
            Option<i32>,
            Option<f64>,
            Option<f64>,
            Option<f64>,
            Option<i32>,
        )>,
        diesel::result::Error,
    > = checks::table
        .left_join(check_detail::table.on(checks::CheckID.eq(check_detail::CheckID)))
        .filter(checks::CheckClose.ge(date_start))
        .filter(checks::CheckClose.lt(date_end))
        .filter(checks::SubTotal.is_not_null())
        .filter(checks::SubTotal.ge(0.0))
        .filter(check_detail::DetailType.eq(4))
        .filter(check_detail::ObjectNumber.ne(ignore_obj_num))
        .select((
            checks::CheckNumber,
            checks::Guid,
            checks::Covers,
            checks::Payment,
            checks::SubTotal,
            checks::Tax,
            check_detail::RevCtrID,
        ))
        .distinct()
        .order_by(checks::CheckNumber.asc())
        .load::<(
            i32,
            String,
            Option<i32>,
            Option<f64>,
            Option<f64>,
            Option<f64>,
            Option<i32>,
        )>(&mut conn);

    match results {
        Ok(records) => {
            let closed_checks = records
                .into_iter()
                .map(
                    |(check_number, guid, covers, payment, sub_total, tax, rev_ctr_id)| {
                        // Extract sequence number from Guid: remove non-digits, take first 9 chars
                        let digits_only = guid
                            .chars()
                            .filter(|c| c.is_ascii_digit())
                            .collect::<String>();
                        let sequence_number: i64 = digits_only
                            .chars()
                            .take(9)
                            .collect::<String>()
                            .parse()
                            .unwrap_or(0);

                        ExportedCheck {
                            check_number,
                            sequence_number,
                            check_total: payment.unwrap_or(0.0),
                            sub_total: sub_total.unwrap_or(0.0),
                            tax_total: tax,
                            guest_count: covers.unwrap_or(0),
                            revenue_center_id: rev_ctr_id,
                        }
                    },
                )
                .collect::<Vec<ExportedCheck>>();

            (
                StatusCode::OK,
                Json(json!({ "closedChecks": closed_checks })),
            )
        }
        Err(e) => {
            eprintln!("Database error: {:?}", e);
            (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({ "closedChecks": [] })),
            )
        }
    }
}
