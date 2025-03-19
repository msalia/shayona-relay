use std::sync::Arc;

use axum::{extract::State, http::StatusCode, response::IntoResponse};

use crate::server::AppState;

pub async fn post_checks_to_export(State(_state): State<Arc<AppState>>) -> impl IntoResponse {
    StatusCode::OK
}
