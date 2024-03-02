#!/bin/bash

for file in *; do
    if [[ -f "$file" ]]; then
        # Remove underscores from file name
        new_name=$(echo "$file" | tr -d '_')
        # Rename the file
        mv "$file" "$new_name"
        echo "Renamed $file to $new_name"
    fi
done