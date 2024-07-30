#!/usr/bin/env bash

read -p "Source Directory: " source

if [ ! -d "$source" ]; then
	echo "Error: Source directory does not exist."
	exit 1
fi

read -p "Destination Directory: " destination

if [ ! -d "$destination" ]; then
	echo "Error: Destination directory does not exist."
	exit 1
fi

rsync -av --delete "$source/" "$destination"

echo "Success!"