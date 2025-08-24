#!/bin/bash

# Get Current date & time for unique file name
current_time=$(date +%y%m%d_%H%M%S)

# Loop to create 5 files
for i in {1..5}
do
    # Create unique file name
    filename="File_${current_time}_$i.txt"

    # Create file
    touch "$filename"

    # Operation: Add some content to newly created files
    echo "This is file no. $i created on $current_time." > "$filename"
    echo "Created: $filename"
done