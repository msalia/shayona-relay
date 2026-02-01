use std::env;
use std::time::Duration;

use mysql::*;
use paris::{error, info};

pub fn get_db_conn() -> mysql::Pool {
    let host = env::var("DATABASE_HOST").unwrap();
    let port = env::var("DATABASE_PORT").unwrap();
    let user = env::var("DATABASE_USER").unwrap();
    let pass = env::var("DATABASE_PASS").unwrap();
    let database = env::var("DATABASE").unwrap();

    // MySQL connection pool options
    let pool_opts = PoolOpts::new()
        .with_constraints(PoolConstraints::new(10, 20).unwrap())
        .with_reset_connection(true);

    // MySQL database connection options
    let opts = OptsBuilder::new()
        .ip_or_hostname(Some(host))
        .tcp_port(port.parse::<u16>().unwrap())
        .user(Some(user))
        .pass(Some(pass))
        .db_name(Some(database))
        .tcp_connect_timeout(Some(Duration::from_secs(10)))
        .pool_opts(pool_opts);

    info!("Attempting to connect to database...");

    // Create a new connection pool
    match Pool::new(opts) {
        Ok(conn) => conn,
        Err(error) => {
            error!("Unable to connect to database");
            panic!("{error:?}")
        }
    }
}
