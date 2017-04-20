#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Usage: list.sh [base url]"
    exit 1
fi

curl -X POST $1/api/v1/actions/weather/gather