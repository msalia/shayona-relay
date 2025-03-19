use axum::{routing::get, routing::post, Router};
use dotenv::dotenv;
use paris::{info, success};
use std::env;
use std::net::SocketAddr;
use tokio::net::TcpListener;

mod routes;
mod server;

#[tokio::main]
async fn main() {
    dotenv().ok();

    info!("Starting server...");

    let router = Router::new()
        .route("/relay", post(crate::routes::relay_routes::post_relay))
        .route("/db", get(crate::routes::db_routes::get_db))
        .route("/configs", get(crate::routes::config_routes::get_configs))
        .route("/osb", post(crate::routes::osb_routes::post_osb))
        .route("/sales", post(crate::routes::analytics_routes::post_sales))
        .route(
            "/checksToExport",
            post(crate::routes::checks_routes::post_checks_to_export),
        )
        .route("/stats", post(crate::routes::analytics_routes::post_stats))
        .with_state(crate::server::get_state())
        .layer(crate::server::get_cors());

    let port = env::var("RELAY_PORT").unwrap().parse::<u16>().unwrap();
    let addr = SocketAddr::from(([127, 0, 0, 1], port));
    let tcp = TcpListener::bind(&addr).await.unwrap();

    success!("Server listening on http://localhost:{port}");

    axum::serve(tcp, router).await.unwrap();
}
