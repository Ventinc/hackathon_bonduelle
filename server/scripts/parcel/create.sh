#!/usr/bin/env bash

if [ "$#" -ne 4 ]; then
    echo "Usage: list.sh [base url] [field id] [longitude] [latitude]"
    exit 1
fi

curl -X POST --data "longitude=$3&latitude=$4" $1/api/v1/field/$2/parcels.json