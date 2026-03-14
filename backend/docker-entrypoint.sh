#!/bin/bash

echo "Waiting for MySQL..."
until mysql -h"$MYSQLHOST" -P"$MYSQLPORT" -u"$MYSQLUSER" -p"$MYSQLPASSWORD" "$MYSQLDATABASE" &>/dev/null; do
  sleep 2
done

echo "Running schema..."
mysql -h"$MYSQLHOST" -P"$MYSQLPORT" -u"$MYSQLUSER" -p"$MYSQLPASSWORD" "$MYSQLDATABASE" < /var/www/html/database/schema.sql

echo "Starting Apache..."
apache2-foreground
