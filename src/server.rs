use axum::http::Method;
use paris::success;
use std::sync::Arc;
use tower_http::cors::{Any, CorsLayer};

pub struct AppState {
    pub pool: mysql::Pool,
}

pub fn get_state() -> Arc<AppState> {
    let pool = crate::database::connection::get_db_conn();
    success!("Connected to database...");
    Arc::new(AppState { pool })
}

pub fn get_cors() -> CorsLayer {
    CorsLayer::new()
        // allow `GET` and `POST` when accessing the resource
        .allow_methods([Method::GET, Method::POST])
        // allow requests from any origin
        .allow_origin(Any)
}
