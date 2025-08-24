#!/bin/bash
read -p "Enter a number=" value

#if [ "$value" -gt 500 ]; then

if [ "$value" -eq 500 ] 2>/dev/null; then
	echo "You gussed correctly."

elif [ $value -gt 500 ]; then
	echo "The condition is True."

else
	echo "The condition is False."

fi
