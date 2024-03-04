#!/usr/bin/env bash

# Prompt user for source directory path
read -p "Enter the source directory path: " source_dir
# Validate source directory path
if [ ! -d "$source_dir" ]; then
	echo "Error: Source directory does not exist."
	exit 1
fi

# Prompt user for destination directory path
read -p "Enter the destination directory path: " destination_dir
# Validate destination directory path
if [ ! -d "$destination_dir" ]; then
	echo "Error: Destination directory does not exist."
	exit 1
fi

# Clone source directory to destination using rsync
rsync -av --delete "$source_dir/" "$destination_dir"

echo "Directory cloned successfully."