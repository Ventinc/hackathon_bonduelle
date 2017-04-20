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
    ./client "$(getMeasurement) TEMPERATURE $(getTemperature) $(getGPSCoords)"
    ./client "$(getMeasurement) HUMIDITY $(getHumidity) $(getGPSCoords)"
    ./client "$(getMeasurement) LUMINOSITY $(getLuminosity) $(getGPSCoords)"
    ./client "$(getMeasurement) MOISTURE $(getMoisture) $(getGPSCoords)"
}

main
