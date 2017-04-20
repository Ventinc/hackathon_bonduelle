#!/usr/bin/env bash

if [ "$#" -ne 8 ]; then
    echo "Usage: list.sh [base url] [field id] [parcel id] [moisture id] [value] [longitude] [latitude] [date]"
    exit 1
fi

curl -X PUT --data "value=$5&longitude=$6&latitude=$7&date=$8" $1/api/v1/field/$2/parcel/$3/moisture/$4.json