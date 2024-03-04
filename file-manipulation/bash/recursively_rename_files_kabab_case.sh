#!/usr/bin/env bash

# Define a function to recursively rename files and directories
rename_recursive() {
    local item
    for item in "$1"/*; do
        # Check if the item is a file or directory
        if [ -d "$item" ]; then
            # If it's a directory, recursively call the function
            rename_recursive "$item"
        elif [ -f "$item" ]; then
            # If it's a file, rename it
            file_name=$(basename "$item")
            file_path=$(dirname "$item")
            new_file_name=$(echo "$file_name" | tr '[:upper:]' '[:lower:]' | tr '[:space:]_' '-')
            new_file_name=$(echo "$new_file_name" | tr -s '-')
            new_file_name=$(echo "$new_file_name" | sed 's/-$//')

            # Check if the new file name is different from the old one
            if [ "$file_name" != "$new_file_name" ]; then
                # Rename file
                mv "$item" "$file_path/$new_file_name"
                echo "Renamed '$file_name' to '$new_file_name'"
            fi
        fi
    done
}

# Start recursive renaming from the current directory
rename_recursive .

