#!/bin/bash

for file in *; do
    if [[ -f "$file" ]]; then
        # Convert PascalCase to snake_case
        new_name=$(echo "$file" | sed 's/\([a-z0-9]\)\([A-Z]\)/\1_\2/g' | tr '[:upper:]' '[:lower:]')
        # Rename the file
        mv "$file" "$new_name"
        echo "Renamed $file to $new_name"
    fi
done