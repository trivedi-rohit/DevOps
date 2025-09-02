#!/bin/bash
read -p "Enter the path to the text file: " file
if [ ! -f "$file" ]; then
    echo "File not found: $file"
    exit 1
fi
lines=$(wc -l < "$file")
words=$(wc -w < "$file")
chars=$(wc -m < "$file")

longest=$(tr -cs '[:alnum:]' '[\n*]' < "$file" | awk '{ if (length > max) { max = length; word = $0 } } END { print word }')

echo ""
echo "File: $file"
echo "------------------------------------"
echo "Li          : $lines"
echo "Words       : $words"
echo "Character   : $chars"
echo "Longest word: $longest"
