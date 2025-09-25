#!/bin/bash
DIR="myFiles"

No_of_files=4

mkdir -p $DIR

for i in $(seq 1 $No_of_files); do
    FILE="$DIR/file_$i.txt"  # Corrected the file naming to include $i
    echo "This is file number $i" > $FILE  # Write content to the file correctly
    echo "Created $FILE"
done

echo "Task Completed"

