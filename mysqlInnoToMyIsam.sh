#!/bin/bash

USER="root"
#PASS=$(cat /usr/local/ispconfig/server/lib/mysql_clientdb.conf | grep '$clientdb_password' | cut -d"'" -f 2) # get it from ispconfig conf
PASS=""
DB="phpmyadmin"
SQLSTMT=convert_innotomy_$DB.sql

# go through DB and make query statements
mysql -u $USER -p$PASS -AN -e"SELECT CONCAT('ALTER TABLE ',table_schema,'.',table_name,' ENGINE=MyISAM;') FROM information_schema.tables WHERE table_schema='$DB' AND engine='InnoDB';" > ${SQLSTMT}

# run queries
mysql -u $USER -p$PASS -A < ${SQLSTMT}

# delete query file
rm $SQLSTMT