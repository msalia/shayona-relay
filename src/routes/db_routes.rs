use std::collections::HashMap;
use std::sync::Arc;

use axum::{extract::State, http::StatusCode, response::IntoResponse, Json};
use diesel::prelude::*;
use serde_json::json;

use crate::database::schema::{menu_item_definition, menu_item_master, print_class};
use crate::server::AppState;

pub async fn get_db(State(state): State<Arc<AppState>>) -> impl IntoResponse {
    let conn = state.pool.get_conn().unwrap();

    let results: Result<Vec<(Option<i32>, String)>, diesel::result::Error> =
        menu_item_master::table
            .left_join(
                menu_item_definition::table
                    .on(menu_item_master::MenuItemMasterID
                        .eq(menu_item_definition::MenuItemMasterID)),
            )
            .left_join(
                print_class::table
                    .on(menu_item_definition::PrintClassObjNum.eq(print_class::ObjectNumber)),
            )
            .select((
                menu_item_master::ObjectNumber,
                print_class::OrderDeviceOutput,
            ))
            .load::<(Option<i32>, String)>(&mut conn);

    match results {
        Ok(records) => {
            let mut menu_item_info: HashMap<i32, Vec<i32>> = HashMap::new();

            for (object_number, order_device_output) in records {
                if let Some(obj_num) = object_number {
                    let device_ids = order_device_output
                        .chars()
                        .enumerate()
                        .filter_map(|(index, ch)| {
                            ch.to_digit(10).and_then(|digit| {
                                if digit == 1 {
                                    Some((index + 1) as i32)
                                } else {
                                    None
                                }
                            })
                        })
                        .collect::<Vec<i32>>();

                    menu_item_info.insert(obj_num, device_ids);
                }
            }

            (
                StatusCode::OK,
                Json(json!({ "menuItemInfo": menu_item_info })),
            )
        }
        Err(e) => {
            eprintln!("Database error: {:?}", e);
            (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({ "menuItemInfo": {} })),
            )
        }
    }
}
