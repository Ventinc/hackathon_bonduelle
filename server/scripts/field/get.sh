#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
    echo "Usage: [base url] [id]"
    exit 1
fi

curl $1/api/v1/field/$2.json