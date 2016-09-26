#!/bin/bash

URL_FILE="url.txt"
SQL_FILE="update.sql"

while read line
do

	ID=`echo $line | awk -F, '{print $1}'`
	DOMIN=`echo $line | awk -F, '{print $3}'`
	#echo $DOMIN
	URL=`curl -I $DOMIN|grep -i location | awk '{print $2}'`
	echo "$ID,$URL" >> $URL_FILE

done < domin.txt
