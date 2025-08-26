#!/bin/bash

for file in /home/rohit/Desktop/Romo/countable/*.txt
do 
	line_count=$(wc -l < $file)
	echo "Line count is $line_count" >> $file
done
