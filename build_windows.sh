export MYSQLCLIENT_CFLAGS=`pkg-config mysqlclient --cflags`
export MYSQLCLIENT_LDFLAGS=`pkg-config mysqlclient --libs`
export PATH="/opt/homebrew/opt/mysql-client@8.4/bin:$PATH"
mysql --version
cargo build --target x86_64-pc-windows-gnu