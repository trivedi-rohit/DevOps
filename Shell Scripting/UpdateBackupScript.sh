#!/bin/bash

directory_to_backup=$1  
backup_location=$2

# Validate input arguments
if [ -z "$directory_to_backup" ] || [ -z "$backup_location" ]; then
    echo "Usage: $0 <directory_to_backup> <backup_location>"
    exit 1
fi

# Get current date
current_date=$(date +'%Y-%m-%d')

# Create the backup
tar -czf "$backup_location/backup-$current_date.tar.gz" -C "$(dirname "$directory_to_backup")" "$(basename "$directory_to_backup")"

# Success message
echo "Backup of $directory_to_backup is created successfully on $current_date inside $backup_location."
