#!/bin/bash

if [ -z "$1" ]; then
    echo "URL not passed"
    exit 1
fi

target_url=$1

java -jar ZAP/zap-2.12.0.jar -cmd -quickurl $target_url -quickprogress