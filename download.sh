#!/bin/bash

# Usage download.sh URI outfile

[ $# -lt 2 ] && { echo 'Error: not enough arguments'; exit 1; }

retryCount=0
returnCode=127
while [ $returnCode -gt 0 ]; do
    curl --user-agent "sdn-downloader" -f "$1" -o "$2" 1>> download.log 2>&1;
    returnCode=$?
    if [ $retryCount -gt 5 ]; then
        echo "Download Error: max retry count reached with curl exit code $returnCode" >&2
        exit 1
    fi
    if [ $returnCode -gt 0 ]; then
        retryCount=`expr $retryCount + 1`
        sleep 30
    fi
done

exit 0
