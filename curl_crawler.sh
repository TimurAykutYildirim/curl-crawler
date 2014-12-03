#!/bin/bash
file="url-list.txt"

while read line
do 
  outfile=$(echo $line | awk 'BEGIN { FS = "/" } ; {print $NF}')
  curl -o "$outfile.html" "$line"
done < "$file"
