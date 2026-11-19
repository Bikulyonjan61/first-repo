#!/bin/bash
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 file1 [file2 ...]"
    exit 1
else
    for item in "$@"; do
        if [[ -f "$item" ]]; then
            lines=$(wc -l < "$item" | tr -d ' ')
            echo "$item has $lines lines"
        else
            echo "$item does not exist"
        fi
    done
fi
