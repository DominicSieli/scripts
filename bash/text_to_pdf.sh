#!/usr/bin/env bash

set -euo pipefail

read -p "Source File: " source_file
read -p "Output File Name: " output_file

enscript $source_file --output=- | ps2pdf - > ${output_file}.pdf