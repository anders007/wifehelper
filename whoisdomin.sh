#!/bin/bash

COUNTRY_CODE_FILE="country_code.txt"
COUNTRY_NAME_FILE="country.txt"

while read line
do
	ID=`echo $line | awk -F',' '{print $1}'`
	DOMIN=`echo $line| awk -F',' '{print $3}'`
	COUNTRYCODE=$(whois ${DOMIN}|grep -i "admin country"|awk -F' |:' '{print $4}')
	#echo ${ID},${COUNTRYCODE},${DOMIN} >> $COUNTRY_FILE
	#COUNTRYNAME=$(cat nation.csv |grep ",${COUNTRYCODE},"|awk -F',' '{print $1}')
	echo ${ID},${DOMIN},${COUNTRYCODE} >> $COUNTRY_CODE_FILE

	#echo  $ID, $DOMIN, $COUNTRYCODE, $COUNTRYNAME
	#echo $ID,$COUNTRYNAME >> $COUNTRY_FILE

done < domin.txt

echo "start analysis country name"
dos2unix $COUNTRY_CODE_FILE

while read line
do
        ID=`echo $line | awk -F',' '{print $1}'`
        DOMIN=`echo $line| awk -F',' '{print $2}'`
        COUNTRYCODE=`echo $line| awk -F',' '{print $3}'`
        COUNTRYNAME=$(cat nationcode.csv |grep ",${COUNTRYCODE},"|awk -F',' '{print $1}')
        echo ${ID},${DOMIN},${COUNTRYCODE},${COUNTRYNAME} >> $COUNTRY_NAME_FILE

done < $COUNTRY_CODE_FILE

