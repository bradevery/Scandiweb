#!/bin/sh

echo "Importing schema..."
echo "Host: $MYSQLHOST Port: $MYSQLPORT User: $MYSQLUSER DB: $MYSQLDATABASE"
mysql -h"$MYSQLHOST" -P"$MYSQLPORT" -u"$MYSQLUSER" -p"$MYSQLPASSWORD" "$MYSQLDATABASE" < /var/www/html/database/schema.sql && echo "Schema imported." || echo "Schema import failed."

echo "Starting php-fpm..."
php-fpm -D

echo "Starting nginx..."
nginx -g "daemon off;"
