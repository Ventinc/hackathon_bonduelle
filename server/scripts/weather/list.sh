#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
    echo "Usage: list.sh [base url] [field id]"
    exit 1
fi

curl $1/api/v1/field/$2/weathers.json