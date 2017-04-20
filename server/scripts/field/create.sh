#!/usr/bin/env bash

if [ "$#" -ne 4 ]; then
    echo "Usage: [base url] [name] [longitude] [latitude]"
    exit 1
fi

curl -X POST --data "name=$2&longitude=$3&latitude=$4" "$1/api/v1/fields.json"
