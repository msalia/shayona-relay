use crate::server::AppState;
use axum::{extract::State, http::StatusCode, response::IntoResponse, Json};
use mysql::prelude::*;
use serde_json::json;
use std::collections::HashMap;
use std::sync::Arc;

pub async fn get_db(State(state): State<Arc<AppState>>) -> impl IntoResponse {
    // grab a connection from the mysql pool
    let mut conn = state.clone().pool.get_conn().unwrap();

    // SQL mirrors the JavaScript handler's query
    let query = "select
        master.ObjectNumber,
        masterDef.PrintClassObjNum,
        printClass.OrderDeviceOutput
    from menu_item_master as master
    right join menu_item_definition as masterDef
        on master.MenuItemMasterID = masterDef.MenuItemMasterID
    right join print_class as printClass
        on masterDef.PrintClassObjNum = printClass.ObjectNumber";

    // build a map keyed by object number with vector of device ids
    let mut menu_item_info: HashMap<String, Vec<i32>> = HashMap::new();

    match conn.query_iter(query) {
        Ok(mut result) => {
            while let Some(Ok(row)) = result.next() {
                let object_number: Option<i64> = row.get("ObjectNumber");
                if let Some(obj) = object_number {
                    let output: Option<String> = row.get("OrderDeviceOutput");
                    let devices = output
                        .unwrap_or_default()
                        .chars()
                        .enumerate()
                        .filter_map(|(idx, ch)| {
                            // only care about digit '1'
                            if ch == '1' {
                                Some((idx + 1) as i32)
                            } else {
                                None
                            }
                        })
                        .collect::<Vec<i32>>();

                    menu_item_info.insert(obj.to_string(), devices);
                }
            }
        }
        Err(e) => {
            eprintln!("Database error: {:?}", e);
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({ "menuItemInfo": {} })),
            );
        }
    }

    (
        StatusCode::OK,
        Json(json!({ "menuItemInfo": menu_item_info })),
    )
}
