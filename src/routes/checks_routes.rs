use crate::server::AppState;
use axum::{extract::State, http::StatusCode, response::IntoResponse, Json};
use mysql::prelude::*;
use serde::{Deserialize, Serialize};
use serde_json::json;
use std::sync::Arc;

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
    // grab a connection from the mysql pool
    let mut conn = state.clone().pool.get_conn().unwrap();

    // mirror the JavaScript query logic from handleChecksToExportRoute
    let query = format!(
        "SELECT distinct
            checks.CheckNumber AS CheckNumber,
            detail.RevCtrID AS RevenueCenterID,
            checks.Guid AS Guid,
            checks.Covers AS Covers,
            checks.Payment AS Payment,
            checks.SubTotal AS SubTotal,
            checks.Tax AS Tax
        FROM checks AS checks
        LEFT JOIN check_detail AS detail ON checks.CheckID = detail.CheckID
        WHERE checks.CheckClose >= '{}'
            AND checks.CheckClose < '{}'
            AND checks.SubTotal IS NOT NULL
            AND checks.SubTotal >= 0.0
            AND detail.DetailType = 4
            AND detail.ObjectNumber != {}
        ORDER BY checks.CheckNumber ASC",
        payload.date_start, payload.date_end, payload.ignore_object_number
    );

    let mut closed_checks: Vec<ExportedCheck> = Vec::new();
    match conn.query_iter(query) {
        Ok(mut result) => {
            while let Some(Ok(row)) = result.next() {
                let check_number: Option<i32> = row.get("CheckNumber");
                let guid: Option<String> = row.get("Guid");
                let check_total: Option<f64> = row.get("Payment");
                let sub_total: Option<f64> = row.get("SubTotal");
                let tax_total: Option<f64> = row.get("Tax");
                let guest_count: Option<i32> = row.get("Covers");
                let revenue_center_id: Option<i32> = row.get("RevenueCenterID");

                if let (
                    Some(check_number),
                    Some(guid_str),
                    Some(check_total),
                    Some(sub_total),
                    Some(guest_count),
                ) = (check_number, guid, check_total, sub_total, guest_count)
                {
                    // convert the GUID into sequence number by stripping non-digits and taking first 9
                    let seq_num_str: String = guid_str
                        .chars()
                        .filter(|c| c.is_ascii_digit())
                        .take(9)
                        .collect();
                    let sequence_number = seq_num_str.parse::<i64>().unwrap_or(0);

                    closed_checks.push(ExportedCheck {
                        check_number,
                        sequence_number,
                        check_total,
                        sub_total,
                        tax_total,
                        guest_count,
                        revenue_center_id,
                    });
                }
            }
        }
        Err(e) => {
            eprintln!("Database error: {:?}", e);
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({ "closedChecks": [] })),
            );
        }
    }

    (
        StatusCode::OK,
        Json(json!({ "closedChecks": closed_checks })),
    )
}
