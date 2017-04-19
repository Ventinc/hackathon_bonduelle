#!/bin/bash

cacheFile="cache"
tmpFile="tmp"


function cleanTmpFile() {
    echo -n "" > $tmpFile
}


function callApi() {


    echo "Calling Api with args" $1

    #curl --connect-timeout 10 --max-time 10 --retry 5 --retry-delay 0 --retry-max-time 6 'https://127.0.0.1'
    
    #Temporary implementation
    local rand=$((RANDOM % 5))


    
    ret=0
    
    if [ $rand -eq 0 ]
    then
	ret=1
    fi
}

function copyCache() {
    echo "copying cache from" $tmpFile "to" $cacheFile
    mv $tmpFile $cacheFile
}


function addToCache() {
    echo "Adding" $1 "to cache"
    echo $1 >> $tmpFile
}


function processCache() {
    while read line
    do
	callApi "$line"
	if [ $ret -ne 0 ]
	then
	    addToCache "$line"
	fi
    done < $cacheFile
}


function getTimestamp() {
    date +%s
}

function rand() {
    echo $((RANDOM % $1))
}

function getTemperature() {
    #python temp.py
    rand 100
}

function getHumidity() {
    #python humidity.py
    rand 100
}

function getLuminosity() {
    #python light.py
    rand 300
}

function getGPSCoords() {
    #python gps.py
    echo $(rand 10)":"$(rand 10)
}

function getMoisture() {
    #python moisture.py
    rand 200
}

function getMeasurement() {
    echo -e $(getTimestamp) "\t" "TEMPERATURE" "\t" $(getTemperature) >> $cacheFile
    echo -e $(getTimestamp) "\t" "HUMIDITY" "\t" $(getHumidity) >> $cacheFile
    echo -e $(getTimestamp) "\t" "LUMINOSITY" "\t" $(getLuminosity) >> $cacheFile
    echo -e $(getTimestamp) "\t" "GPS_COORDS" "\t" $(getGPSCoords) >> $cacheFile
    echo -e $(getTimestamp) "\t" "MOISTURE" "\t" $(getMoisture) >> $cacheFile
}

function __start() {
    cleanTmpFile
    getMeasurement
    processCache
    copyCache
}

__start
