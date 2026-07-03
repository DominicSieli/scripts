#!/usr/bin/env bash

read -rp "file type: " ext
read -rp "directory: " dir

mkdir -p "$dir" &&
find . -type f -iname "*.$ext" -exec mv -n -t "$dir" {} +
