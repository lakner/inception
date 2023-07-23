#! /usr/bin/env /bin/bash

echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME} ;" > wpdb.sql
echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}' ;" >> wpdb.sql
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' ;" >> wpdb.sql
echo "ALTER USER ${ROOT_DB_USER}@'localhost' IDENTIFIED BY ${ROOT_DB_PASS} ;" >> wpdb.sql
echo "FLUSH PRIVILEGES;" >> wpdb.sql

mysqld --user=root --init-file=/wpdb.sql