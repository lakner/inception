#! /usr/bin/env /bin/bash

# mariadbd --user=root -d
# mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
# mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}' ;"
# mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' ;"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;"
# mysql -e "FLUSH PRIVILEGES;"

echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME} ;" > wpdb.sql
echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}' ;" >> wpdb.sql
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' ;" >> wpdb.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> wpdb.sql
echo "FLUSH PRIVILEGES;" >> wpdb.sql

mysqld --user=root --init-file=/wpdb.sql