#!/bin/bash
file="url-list.txt"
COUNT=0

while read line
do
	STATUS=$(curl -s -o /dev/null -w "%{http_code}\n" "$line")
	if [ $STATUS == 200 ] ; then
		#echo "$line URL up, returned $STATUS"
		COUNT=$((COUNT+1))
		echo "$COUNT"
		outfile=$(echo $line | awk 'BEGIN { FS = "/" } ; {print $NF}')
		curl -o "$outfile.html" "$line" &> /dev/null
	else
	       echo "$line is not up, returned $STATUS"
	fi
done < "$file"
