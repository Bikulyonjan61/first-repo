#!/bin/bash
for file in *.py; do
    lines=$(wc -l < "$file" | tr -d ' ')
    echo "$file has $lines lines"
done