#!/bin/bash
sym=$1
if [ -n "$1" ] && (($# == 1))
then
    if [[ $1 =~ ^[0-9+\.+\,]+$ ]]
    then
        echo "ENTER THE STRING"
    else
    echo $1
    fi
else
    echo "ERROR READING PARAMETERS"
fi