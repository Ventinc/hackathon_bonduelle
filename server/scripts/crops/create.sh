#!/usr/bin/env bash

if [ "$#" -ne 3 ]; then
    echo "Usage: list.sh [base url] [field id] [name]"
    exit 1
fi

curl -X POST --data "name=$3" $1/api/v1/field/$2/crops.json