#!/bin/bash

if [ $# -ne 2 ]; then
	exit 1
fi

filesdir="$1"
searchstr="$2"

# echo "filesdir is: '$filesdir'"

if [ ! -d "$filesdir" ]; then
	exit 1
fi

file_count=$(find "$filesdir" -type f | wc -l)

match_count=$(grep -r -R -I -F -o -- "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "The number of files are $file_count and the number of matching lines are $match_count"
