#!/bin/bash

# Loop through all files in the current directory
for file in *; do
	# Check if the file exists and is not already lowercase
	if [ -f "$file" ] && [ "$file" != "${file,,}" ]; then
		# Rename the file to lowercase
		mv -i "$file" "${file,,}"
		echo "Renamed $file to ${file,,}"
	fi
done
