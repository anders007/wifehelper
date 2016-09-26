#!/bin/bash

URL_FILE="url.txt"
SQL_FILE="update.sql"

echo "USE xhstjjc;" >> $SQL_FILE
while read line
do

	ID=`echo $line | awk -F, '{print $1}'`
        URL=`echo $line | awk -F, '{print $2}'`

	if [ -n "$URL" ]
	then
		echo "UPDATE xhs_media_rel_host SET url='$URL' WHERE mid=$ID;" >> $SQL_FILE
	fi

done < $URL_FILE
