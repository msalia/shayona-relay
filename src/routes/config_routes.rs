use std::sync::Arc;

use axum::{extract::State, http::StatusCode, response::IntoResponse};

use crate::server::AppState;

pub async fn get_configs(State(_state): State<Arc<AppState>>) -> impl IntoResponse {
    let data = r#"
        {
            "taxClasses": [
                {
                    "propertyID",
                    "taxClassRef",
                    "taxClassName",
                    "taxRateRef",
                    "taxRatePercentage",
                }
            ]
        }"#;

    (StatusCode::OK, data)
}
