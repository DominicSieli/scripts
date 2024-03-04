#!/usr/bin/env bash

# Loop through each file in the current directory
for file in *; do
    # Check if the item is a file
    if [ -f "$file" ]; then
        # Extract the file name and extension
        file_name="${file%.*}"
        extension="${file##*.}"

        # Convert file name to lowercase snake-case
        new_file_name=$(echo "$file_name" | tr '[:upper:]' '[:lower:]' | tr '[:space:]-' '_')
        new_file_name=$(echo "$new_file_name" | tr -s '_')

        # Remove trailing underscores from the file name
        new_file_name=$(echo "$new_file_name" | sed 's/_*$//')

        # Add extension back to the new file name
        new_file_name="$new_file_name.$extension"

        # Check if the new file name is different from the old one
        if [ "$file" != "$new_file_name" ]; then
            # Rename file
            mv "$file" "$new_file_name"
            echo "Renamed '$file' to '$new_file_name'"
        fi
    fi
done
