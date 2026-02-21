use mysql::*;
use paris::{error, info};
use std::env;

pub fn get_db_conn() -> mysql::Pool {
    let database_url = env::var("DATABASE_URL").unwrap();

    // MySQL connection pool options
    let pool_opts = PoolOpts::new()
        .with_constraints(PoolConstraints::new(10, 20).unwrap())
        .with_reset_connection(true);

    // MySQL database connection options
    let opts_from_url = Opts::from_url(&database_url).unwrap();
    let opts = OptsBuilder::from_opts(opts_from_url).pool_opts(pool_opts);

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
