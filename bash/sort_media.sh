#!/usr/bin/env bash

set -euo pipefail

exiftool -r -ext jpg -ext jpeg -ext png '-FileName<${DateTimeOriginal;DateFmt("%Y%m%d_%H%M%S")}.%e' .
exiftool -r -ext jpg -ext jpeg -ext png '-Directory<photos/${DateTimeOriginal;DateFmt("%Y/%m")}' .

exiftool -r -ext mp4 -ext mov -ext m4v -ext avi '-FileName<${CreateDate;DateFmt("%Y%m%d_%H%M%S")}.%e' .
exiftool -r -ext mp4 -ext mov -ext m4v -ext avi '-Directory<videos/${CreateDate;DateFmt("%Y/%m")}' .

find . -depth -type d -empty -delete
