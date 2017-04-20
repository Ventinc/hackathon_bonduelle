#!/usr/bin/env bash

if [ "$#" -ne 5 ]; then
    echo "Usage: [base url] [id] [name] [longitude] [latitude]"
fi

curl -X PUT --data "name=$3&longitude=$4&latitude=$5" "$1/api/v1/field/$2.json"
