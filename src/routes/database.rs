use std::time::Duration;

use mysql::*;
use paris::{error, info};

pub fn get_db_conn() -> mysql::Pool {
    let opts = OptsBuilder::new()
        .ip_or_hostname(Some("10.21.174.50"))
        .tcp_port(3306)
        .user(Some("datauser"))
        .pass(Some("Mr$0200097a"))
        .db_name(Some("bar"))
        .tcp_connect_timeout(Some(Duration::from_secs(10)));

    info!("Attempting to connect to database...");

    match Pool::new(opts) {
        Ok(conn) => conn,
        Err(error) => {
            error!("Unable to connect to database");
            panic!("{error:?}")
        }
    }
}
