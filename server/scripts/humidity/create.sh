#!/usr/bin/env bash

if [ "$#" -ne 7 ]; then
    echo "Usage: list.sh [base url] [field id] [parcel id] [value] [longitude] [latitude] [date]"
    exit 1
fi

curl -X POST --data "value=$4&longitude=$5&latitude=$6&date=$7" $1/api/v1/field/$2/parcel/$3/humidities