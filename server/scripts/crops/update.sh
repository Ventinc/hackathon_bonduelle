#!/usr/bin/env bash

if [ "$#" -ne 6 ]; then
    echo "Usage: list.sh [base url] [field id] [crop id] [name] [timestamp] [quantity]"
    exit 1
fi

curl -X PUT --data "name=$4&date_harvest=$5&quantity=$6" $1/api/v1/field/$2/crop/$3.json