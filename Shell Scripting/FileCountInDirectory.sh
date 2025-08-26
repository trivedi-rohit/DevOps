#!/bin/bash

directory_to_check=$1

#Till the time a directory is present, loop will keep on running.
while [ "$(ls -A $directory_to_check)"  ]
do
	file_count=$(ls -1 $directory_to_check | wc -l)
	echo "The file count in the $directory_to_check is $file_count"
	sleep 5
done
echo "Directory is empty now."

