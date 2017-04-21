#!/usr/bin/env bash

if [ "$#" -ne 3 ]; then
    echo "Usage: list.sh [base url] [field_id] [crop id]"
    exit 1
fi

curl $1/api/v1/field/$2/crop/$3.json