use std::env;
use std::sync::Arc;

use axum::{extract::State, http::StatusCode, response::IntoResponse, Json};
use reqwest;
use serde_json::{json, Value};

use crate::server::AppState;

pub async fn post_relay(
    State(state): State<Arc<AppState>>,
    Json(data): Json<Value>,
) -> impl IntoResponse {
    let start_time = std::time::Instant::now();
    let ob_url: String = match env::var("RELAY_DB_HOST") {
        Ok(url) => url,
        Err(e) => {
            let duration = start_time.elapsed();
            eprintln!(
                "FAILED: /relay - Missing RELAY_DB_HOST environment variable: {:?}",
                e
            );
            eprintln!("FAILED: /relay in {:.2}ms", duration.as_secs_f64() * 1000.0);
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({"error": "Configuration error"})),
            );
        }
    };

    match reqwest::post(&ob_url).json(&data).send().await {
        Ok(response) => match response.json::<Value>().await {
            Ok(json_response) => {
                let duration = start_time.elapsed();
                eprintln!("SUCCESS: /relay - Error response: {:?}", error);
                eprintln!(
                    "SUCCESS: /relay in {:.2}ms",
                    duration.as_secs_f64() * 1000.0
                );
                (StatusCode::OK, Json(json_response))
            }
            Err(e) => {
                let duration = start_time.elapsed();
                eprintln!("FAILED: /relay in {:.2}ms", duration.as_secs_f64() * 1000.0);
                (
                    StatusCode::INTERNAL_SERVER_ERROR,
                    Json(json!({"error": error})),
                )
            }
        },
        Err(e) => {
            let duration = start_time.elapsed();
            eprintln!("FAILED: /relay - Request error: {:?}", e);
            eprintln!("FAILED: /relay in {:.2}ms", duration.as_secs_f64() * 1000.0);
            (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({"error": "Failed to relay request"})),
            )
        }
    }
}
