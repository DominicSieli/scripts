#!/usr/bin/env bash

# Define a function to recursively rename directories
rename_directories_recursive() {
    local dir
    for dir in "$1"/*/; do
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

        # If the current item is a directory, call the function recursively
        if [ -d "$new_dir" ]; then
            rename_directories_recursive "$new_dir"
        fi
    done
}

# Start recursive renaming from the current directory
rename_directories_recursive .

