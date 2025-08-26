#!/bin/bash

directory_to_backup=$1  
backup_location=$2

# Validate input arguments
if [ -z "$directory_to_backup" ] || [ -z "$backup_location" ]; then
    echo "Usage: $0 <directory_to_backup> <backup_location>"
    exit 1
fi

# Current date
current_date=$(date +'%Y-%m-%d')

# Backup
tar -czf "$backup_location/backup-$current_date.tar.gz" -C "$(dirname "$directory_to_backup")" "$(basename "$directory_to_backup")"

status=$?
# Success message
echo "Backup of $directory_to_backup is created successfully on $current_date inside $backup_location."

if [ $status -eq 0 ]; then
	echo "Backup Script executed succesfully"
else
	echo "Something went wrong!"
fi
