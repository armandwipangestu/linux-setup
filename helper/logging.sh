#!/bin/bash

function log() {
    NAME=$1
    LEVEL=$2
    MESSAGE=$3
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$TIMESTAMP] - $NAME - $LEVEL - $MESSAGE"
}