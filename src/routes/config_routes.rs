use std::sync::Arc;

use axum::{extract::State, http::StatusCode, response::IntoResponse, Json};
use diesel::prelude::*;
use serde::Serialize;
use serde_json::json;

use crate::database::models::{
    HierarchyStructure, HierarchyUnit, StringTable, Tax, TaxClas, TaxClassTax,
};
use crate::database::schema::{
    hierarchy_structure, hierarchy_unit, string_table, tax, tax_class, tax_class_tax,
};
use crate::server::AppState;

#[derive(Serialize)]
pub struct TaxClassInfo {
    #[serde(rename = "propertyID")]
    pub property_id: Option<i32>,
    #[serde(rename = "taxClassRef")]
    pub tax_class_ref: i32,
    #[serde(rename = "taxClassName")]
    pub tax_class_name: Option<String>,
    #[serde(rename = "taxRateRef")]
    pub tax_rate_ref: Option<i16>,
    #[serde(rename = "taxRatePercentage")]
    pub tax_rate_percentage: Option<f64>,
}

pub async fn get_configs(State(state): State<Arc<AppState>>) -> impl IntoResponse {
    let mut conn = state.db_pool.get().unwrap();

    let results = tax_class::table
        .left_join(string_table::table.on(tax_class::NameID.eq(string_table::StringNumberID)))
        .left_join(tax_class_tax::table.on(tax_class_tax::TaxClassID.eq(tax_class::TaxClassID)))
        .left_join(tax::table.on(tax_class_tax::TaxIndex.eq(tax::TaxIndex)))
        .left_join(
            hierarchy_structure::table.on(tax::HierStrucID.eq(hierarchy_structure::HierStrucID)),
        )
        .left_join(
            hierarchy_unit::table
                .on(hierarchy_structure::HierUnitID.eq(hierarchy_unit::HierUnitID)),
        )
        .select((
            tax_class::ObjectNumber,
            string_table::StringText,
            tax_class_tax::TaxIndex,
            tax::Percentage,
            hierarchy_unit::PropertyID,
        ))
        .load::<(
            Option<i32>,
            Option<String>,
            Option<i16>,
            Option<f64>,
            Option<i32>,
        )>(&mut conn);

    match results {
        Ok(records) => {
            let tax_classes: Vec<TaxClassInfo> = records
                .iter()
                .filter_map(
                    |(
                        tax_class_ref,
                        tax_class_name,
                        tax_rate_ref,
                        tax_rate_percentage,
                        property_id,
                    )| {
                        // Filter out records where tax_class_ref is null
                        tax_class_ref.map(|ref_val| TaxClassInfo {
                            property_id: *property_id,
                            tax_class_ref: ref_val,
                            tax_class_name: tax_class_name.clone(),
                            tax_rate_ref: *tax_rate_ref,
                            tax_rate_percentage: *tax_rate_percentage,
                        })
                    },
                )
                .collect();

            (StatusCode::OK, Json(json!({ "taxClasses": tax_classes })))
        }
        Err(e) => {
            eprintln!("Database error: {:?}", e);
            (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({ "taxClasses": [] })),
            )
        }
    }
}
