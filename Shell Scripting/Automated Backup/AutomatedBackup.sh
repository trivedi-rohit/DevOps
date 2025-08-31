#!/bin/bash

read -p "Enter the directory path to back up: " dir_path

if [ ! -d "$dir_path" ]; then
    echo "Directory does not exist: $dir_path"
    exit 1
fi

current_date=$(date +%d-%m-%Y_%H-%M-%S)
backup_file="backup_${dir_name}_${current_date}.tar.gz"

tar -czf "$backup_file" -C "$(dirname "$dir_path")" "$(basename "$dir_path")"

if [ $? -eq 0 ]; then
    echo "Backup successful! File created: $backup_file"
else
    echo "Error occured. Backup failed."
fi
