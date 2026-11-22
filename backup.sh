#!/bin/bash
#run this script to with first argument as the folder to backup and second argumnet as the destion of the backup file. If no destination is given it will default to the current directory. The script will also delete all but the 3 most recent backups in the destination folder.
#first we short the backup files in the destination folder by date and then we delete all but the 3 most recent backups.
#exit codes 
# 0: success
# 1: missing argument, not a folder, can't create destination, or tar failed
today=$(date +%Y-%m-%d_%H-%M-%S)
dest="${2:-.}"
backup_name="backup_$today.tar.gz"
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <folder_to_backup> [destination_folder]"
    exit 1
elif [[ ! -d "$1" ]]; then
    echo "$1 is not a folder"
    exit 1
fi
if ! mkdir -p "$dest"; then
    echo "Could not create destination folder $dest"
    exit 1
fi
echo "Backing up $1 into $backup_name"
if ! tar -czf "$dest/$backup_name" "$1"; then
    echo "Error: backup failed"
    exit 1
fi
ls -t "$dest"/backup_*.tar.gz | tail -n +4 | while IFS= read -r file; do
    rm "$file"
done

echo "Backup created: $backup_name ,successfully"

