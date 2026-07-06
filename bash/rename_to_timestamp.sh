#!/usr/bin/env bash

set -euo pipefail

exiftool -r -ext jpg -ext jpeg -ext png '-FileName<${DateTimeOriginal;$_=$self->GetValue("CreateDate") unless $_;$_=$self->GetValue("FileModifyDate") unless $_;DateFmt("%Y%m%d_%H%M%S")}.%e' .

exiftool -r -ext mp4 -ext mov -ext m4v -ext avi '-FileName<${CreateDate;$_=$self->GetValue("MediaCreateDate") unless $_;$_=$self->GetValue("TrackCreateDate") unless $_;$_=$self->GetValue("FileModifyDate") unless $_;DateFmt("%Y%m%d_%H%M%S")}.%e' .
