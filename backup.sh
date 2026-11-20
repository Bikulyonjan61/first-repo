#!/bin/bash
today=$(date +%Y-%m-%d)
backup_name="backup_$today.tar.gz"
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <folder>"
    exit 1
elif [[ ! -d "$1" ]]; then
    echo "$1 is not a folder"
    exit 1
fi
echo "Backing up $1 into $backup_name"
if ! tar -czf "$backup_name" "$1"; then
    echo "Error: backup failed"
    exit 1
fi
echo "Backup created: $backup_name ,successfully"

