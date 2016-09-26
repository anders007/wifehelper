#!/bin/bash

COUNTRY_CODE_FILE="country_code_last.txt"
COUNTRY_NAME_FILE="country_last.txt"

echo "start analysis country name"
dos2unix $COUNTRY_CODE_FILE

while read line
do
        ID=`echo $line | awk -F',' '{print $1}'`
        DOMIN=`echo $line| awk -F',' '{print $2}'`
        COUNTRYCODE=`echo $line| awk -F',' '{print $3}'`
        COUNTRYNAME=$(cat nation.csv |grep ",${COUNTRYCODE},"|awk -F',' '{print $1}')
        echo ${ID},${DOMIN},${COUNTRYCODE},${COUNTRYNAME} >> $COUNTRY_NAME_FILE

done < $COUNTRY_CODE_FILE

