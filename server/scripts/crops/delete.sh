#!/usr/bin/env bash

if [ "$#" -ne 3 ]; then
    echo "Usage: list.sh [base url] [field id] [crop id]"
    exit 1
fi

curl -X DELETE $1/api/v1/field/$2/crop/$3.json