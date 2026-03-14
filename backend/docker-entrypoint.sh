#!/bin/sh

DB_HOST="${MYSQLHOST:-$MYSQL_HOST}"
DB_PORT="${MYSQLPORT:-${MYSQL_PORT:-3306}}"
DB_USER="${MYSQLUSER:-$MYSQL_USER}"
DB_PASS="${MYSQLPASSWORD:-$MYSQL_PASSWORD}"
DB_NAME="${MYSQLDATABASE:-$MYSQL_DATABASE}"

echo "Importing schema..."
echo "Host: $DB_HOST Port: $DB_PORT User: $DB_USER DB: $DB_NAME"
mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" < /var/www/html/database/schema.sql && echo "Schema imported." || echo "Schema import failed."

echo "Starting php-fpm..."
php-fpm -D

echo "Starting nginx..."
nginx -g "daemon off;"
