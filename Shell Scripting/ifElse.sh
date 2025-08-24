#!/bin/bash
echo "Enter a Number"
read num
if [ $num -gt 10 ] ; then
	echo "The Number is greater than 10."
else
	echo "The number is 10 or less."
fi
