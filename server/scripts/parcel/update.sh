#!/usr/bin/env bash

if [ "$#" -ne 5 ]; then
    echo "Usage: list.sh [base url] [field id] [parcel id] [longitude] [latitude]"
    exit 1
fi

curl -X PUT --data "longitude=$4&latitude=$5" $1/api/v1/field/$2/parcel/$3.json