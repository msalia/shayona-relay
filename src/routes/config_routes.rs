use crate::server::AppState;
use axum::{extract::State, http::StatusCode, response::IntoResponse, Json};
use mysql::prelude::*;
use serde::Serialize;
use serde_json::json;
use std::sync::Arc;

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
    // grab a connection from the mysql pool
    let mut conn = state.clone().pool.get_conn().unwrap();

    // SQL mirrors the JavaScript handler's query
    let query = "SELECT
       TaxClasses.ObjectNumber AS TaxClassRef,
       Names.StringText AS TaxClassName,
       TaxRate.TaxIndex AS TaxRateRef,
       Tax.Percentage AS TaxRatePercentage,
       HierarchyUnit.PropertyID AS PropertyID
    FROM tax_class AS TaxClasses
    LEFT JOIN string_table AS Names
        ON TaxClasses.NameID = Names.StringNumberID
    LEFT JOIN tax_class_tax AS TaxRate
        ON TaxRate.TaxClassID = TaxClasses.TaxClassID
    LEFT JOIN tax AS Tax
        ON TaxRate.TaxIndex = Tax.TaxIndex
    LEFT JOIN hierarchy_structure AS Hierarchy
        ON Tax.HierStrucID = Hierarchy.HierStrucID
    LEFT JOIN hierarchy_unit AS HierarchyUnit
        ON Hierarchy.HierUnitID = HierarchyUnit.HierUnitID";

    let mut tax_classes: Vec<TaxClassInfo> = Vec::new();

    match conn.query_iter(query) {
        Ok(mut result) => {
            while let Some(Ok(row)) = result.next() {
                let tax_class_ref: Option<i32> = row.get("TaxClassRef");
                if let Some(tax_class_ref) = tax_class_ref {
                    let property_id: Option<i32> = row.get("PropertyID");
                    let tax_class_name: Option<String> = row.get("TaxClassName");
                    let tax_rate_ref: Option<i16> = row.get("TaxRateRef");
                    let tax_rate_percentage: Option<f64> = row.get("TaxRatePercentage");

                    tax_classes.push(TaxClassInfo {
                        property_id,
                        tax_class_ref,
                        tax_class_name,
                        tax_rate_ref,
                        tax_rate_percentage,
                    });
                }
            }
        }
        Err(e) => {
            eprintln!("Database error: {:?}", e);
            return (
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({ "taxClasses": [] })),
            );
        }
    }

    (StatusCode::OK, Json(json!({ "taxClasses": tax_classes })))
}
