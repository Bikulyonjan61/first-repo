#!/bin/bash
if [[ $# -eq 0 ]]; then
    echo "Usage: ./check_path.sh <path>"
    exit 1
fi

if [[ -f "$1" ]]; then
    echo "$1 is a file"
elif [[ -d "$1" ]]; then
    echo "$1 is a directory"
else
    echo "$1 does not exist"
    exit 1
fi
