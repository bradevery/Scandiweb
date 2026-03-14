#!/bin/bash

echo "Importing schema..."
mysql -h"$MYSQLHOST" -P"$MYSQLPORT" -u"$MYSQLUSER" -p"$MYSQLPASSWORD" "$MYSQLDATABASE" < /var/www/html/database/schema.sql 2>/dev/null || echo "Schema import skipped or already done."

echo "Starting Apache..."
apache2-foreground
