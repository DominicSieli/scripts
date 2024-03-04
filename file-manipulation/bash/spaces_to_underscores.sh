#!/usr/bin/env bash

for file in *; do
    if [[ -f "$file" ]]; then
        # Replace spaces with underscores in file name
        new_name=$(echo "$file" | tr ' ' '_')
        # Rename the file
        mv "$file" "$new_name"
        echo "Renamed $file to $new_name"
    fi
done