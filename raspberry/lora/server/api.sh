#!/bin/bash


url="127.0.0.1"
fieldId=1
parcelId=1

function callApi() {
    echo $1 $2 $3 $4 $5
    /home/pi/hackathon_bonduelle/server/scripts/"${5,,}"/create.sh $url $fieldId $parcelId $1 $2 $3 $4
}


function main() {
    if [ "$2" = "TEMPERATURE" ]
    then
	callApi $3 "${4##*:}" "${4%:*}" $1 $2
    elif [ "$2" = "HUMIDITY" ]
    then
	callApi $3 "${4##*:}" "${4%:*}" $1 $2
    elif [ "$2" = "LUMINOSITY" ]
    then
	callApi $3 "${4##*:}" "${4%:*}" $1 $2
    elif [ "$2" = "MOISTURE" ]
    then
	callApi $3 "${4##*:}" "${4%:*}" $1 $2
    else
	echo "Invalid type"
	return
    fi
    if [ $? -ne 0 ]
    then
	echo "Error"
	echo $1 $2 $3 $4 >> /home/pi/hackathon_bonduelle/raspberry/scripts/tmp
    fi
}


main $1 $2 $3 $4
