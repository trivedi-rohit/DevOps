#!/bin/bash

# Number of folders to create
num_folders=3

# Number of files per folder
num_files=3

# Base Directory
base_dir=~/Desktop/randomData

# Create base directory
mkdir -p "$base_dir"

# Loop to create folders and files
for ((i=1; i<=num_folders; i++)); do
    # Generate a random folder name
    folder_name="$base_dir/folder_$RANDOM"
    mkdir -p "$folder_name"
    echo "Folder Created: $folder_name"

    # Create files inside the folder
    for ((j=1; j<=num_files; j++)); do
        file_name="$folder_name/file_$j.txt"
        echo "This file $j is created inside folder $folder_name" > "$file_name"
        echo "File Created: $file_name"
    done
done

echo "Task completed."

