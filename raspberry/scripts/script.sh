#!/bin/bash

cacheFile="cache"
tmpFile="tmp"

touch cacheFile
touch tmpFile

function cleanTmpFile() {
    echo -n "" > $tmpFile
}


function copyCache() {
    echo "copying cache from" $tmpFile "to" $cacheFile
    mv $tmpFile $cacheFile
}


function addToCache() {
    echo "Adding" $1 "to cache"
    echo $1 >> $tmpFile
}


function callApi() {
    ../lora/server/api.sh $1
}

function processCache() {
    while read line
    do
	callApi "$line"
    done < $cacheFile
}


function getTimestamp() {
    date +%s
}

function __start() {
    copyCache
    processCache
    copyCache
    cleanTmpFile
}

__start
