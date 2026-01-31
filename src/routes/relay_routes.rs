use std::sync::Arc;

use axum::{extract::State, http::StatusCode, response::IntoResponse, Json};
use serde_json::{json, Value};

use crate::server::AppState;

pub async fn post_relay(
    State(state): State<Arc<AppState>>,
    Json(data): Json<Value>,
) -> impl IntoResponse {
    let ob_url = env::var("RELAY_DB_HOST").unwrap();
    let client = &state.http_client;

    match reqwest::post(ob_url).json(&data).send().await {
        Ok(response) => match response.json::<Value>().await {
            Ok(json_response) => {
                // Check if there's an error in the response
                if let Some(error) = json_response.get("response").and_then(|r| r.get("error")) {
                    eprintln!("FAILED: /relay - Error response: {:?}", error);
                    return (
                        StatusCode::INTERNAL_SERVER_ERROR,
                        Json(json!({"error": error})),
                    );
                }

                eprintln!("SUCCESS: /relay");
                (StatusCode::OK, Json(json_response))
            }
            Err(e) => {
                eprintln!("FAILED: /relay - JSON parsing error: {:?}", e);
                (
                    StatusCode::INTERNAL_SERVER_ERROR,
                    Json(json!({"error": "Failed to parse response"})),
                )
            }
        },
        Err(e) => {
            eprintln!("FAILED: /relay - Request error: {:?}", e);
            (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({"error": "Failed to relay request"})),
            )
        }
    }
}
