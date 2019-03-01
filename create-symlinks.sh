#!/bin/bash

set -eufo pipefail

prefix="$HOME"
src="$(dirname $(realpath $0))"
dst="$prefix"

echo "Source is: $src"
echo "Destination is: $dst"

# For each file create directories and symlink in destination
for f in $(find $src -type f | egrep -v "create-symlinks.sh|delete-local-config.sh|README.md")
do
    conffile="${f#$src/}"
    conffilename="${f##*/}"
    conffilepath="${conffile%$conffilename}"
    
    echo "mkdir -p $dst/$conffilepath"
    mkdir -p $dst/$conffilepath

    echo "ln -s $f $dst/$conffile"
    ln -s $f $dst/$conffile
done