#!/usr/bin/env bash

set -euo pipefail

read -rp "extension: " ext
read -rp "directory: " dir

mkdir -p "$dir"

find . -type f -iname "*.$ext" -exec mv -n -t "$dir" {} +

find . -depth -type d -empty -delete
