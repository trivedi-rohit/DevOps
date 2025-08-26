#!/bin/bash
read -p "Enter a command to check : " cmd_name

if command  -v $cmd_name &> /dev/null ; then
	echo "$cmd_name command exist"
else
	echo "$cmd_name doesn't exist"
fi
