#!/bin/bash

# Ask user for input (time in seconds)
read -p "Enter the time in seconds: " time

echo "Timer started"
# counter loop
for ((i=1; i<=$time; i++)); do
    echo -ne "Time elapsed: $i seconds\r"  # This will update on the same line
    sleep 1
done

echo -e "\nTask completed"  # Print a new line at the end after the loop

