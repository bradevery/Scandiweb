#!/bin/sh

# Default environment variables if not set
DB_HOST="${MYSQLHOST:-${MYSQL_HOST:-localhost}}"
DB_PORT="${MYSQLPORT:-${MYSQL_PORT:-3306}}"
DB_USER="${MYSQLUSER:-${MYSQL_USER:-root}}"
DB_PASS="${MYSQLPASSWORD:-${MYSQL_PASSWORD:-}}"
DB_NAME="${MYSQLDATABASE:-${MYSQL_DATABASE:-railway}}"

echo "Importing schema..."
echo "Host: $DB_HOST Port: $DB_PORT User: $DB_USER DB: $DB_NAME"

# Check if DB_PASS is empty to avoid the -p flag issue
if [ -z "$DB_PASS" ]; then
    mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" "$DB_NAME" < /var/www/html/database/schema.sql && echo "Schema imported." || echo "Schema import failed."
else
    mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < /var/www/html/database/schema.sql && echo "Schema imported." || echo "Schema import failed."
fi

echo "Starting php-fpm..."
php-fpm -D

echo "Starting nginx..."
nginx -g "daemon off;"
