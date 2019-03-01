#!/bin/bash

set -eufo pipefail

prefix="$HOME"
src="$(dirname $(realpath $0))"
dst="$prefix"

echo "Source is: $src"
echo "Destination is: $dst"

# For each file delete actual version
for f in $(find $src -type f | egrep -v "create-symlinks.sh|delete-local-config.sh|README.md|\.git\/")
do
    conffile="${f#$src/}"
    conffilename="${f##*/}"
    conffilepath="${conffile%$conffilename}"
    echo "rm $dst/$conffile"
    set +e
    rm $dst/$conffile
    set -e
done
