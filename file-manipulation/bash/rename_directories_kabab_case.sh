#!/usr/bin/env bash

# Loop through each directory in the current directory
for dir in */; do
    # Remove trailing slash from directory name
    dir="${dir%/}"
    # Convert directory name to lower-case kebab-case
    new_dir=$(echo "$dir" | tr '[:upper:]' '[:lower:]' | tr '[:space:]_' '-')
    new_dir=$(echo "$new_dir" | tr -s '-')
    new_dir=$(echo "$new_dir" | sed 's/-$//')

    # Check if the new directory name is different from the old one
    if [ "$dir" != "$new_dir" ]; then
        # Rename directory
        mv "$dir" "$new_dir"
        echo "Renamed '$dir' to '$new_dir'"
    fi
done


