use mysql::prelude::*;
use std::sync::Arc;

use axum::{extract::State, http::StatusCode, response::IntoResponse};

use crate::server::AppState;

pub async fn get_db(State(state): State<Arc<AppState>>) -> impl IntoResponse {
    let mut conn = state.pool.get_conn().unwrap();
    let result = conn.query(
        "SELECT master.ObjectNumber, masterDef.PrintClassObjNum, printClass.OrderDeviceOutput from menu_item_master as master right join menu_item_definition as masterDef on master.MenuItemMasterID = masterDef.MenuItemMasterID right join print_class as printClass on masterDef.PrintClassObjNum = printClass.ObjectNumber",
    );

    let rows: Vec<(u16, u8, u8)> = match result {
        Ok(rows) => rows,
        Err(_error) => vec![],
    };

    println!("{:?}", rows);

    StatusCode::OK
}
