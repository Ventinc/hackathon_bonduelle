#!/bin/bash

function getTemperature() {
    python ../../scripts/temp.py
}

function getHumidity() {
    python ../../scripts/humidity.py
}

function getLuminosity() {
    python ../../scripts/light.py
}

function getGPSCoords() {
    sudo python ../../scripts/gps.py
}

function getMoisture() {
    python ../../scripts/moisture.py
}

function getMeasurement() {
    echo -e $(getTimeStamp) $1 $($2)
}

function getTimeStamp() {
    date +%s
}

function rand() {
    echo $((RANDOM % $1))
}


function main() {
    gps=$(getGPSCoords)
    ./client "$(getMeasurement) TEMPERATURE $(getTemperature) $gps"
    ./client "$(getMeasurement) HUMIDITY $(getHumidity) $gps"
    ./client "$(getMeasurement) LUMINOSITY $(getLuminosity) $gps"
    ./client "$(getMeasurement) MOISTURE $(getMoisture) $gps"
}

main
