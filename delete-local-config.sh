#!/bin/bash

set -eufo pipefail

src="$(dirname $(realpath $0))"

echo "Source is: $src"

# For each file delete actual version
for f in $(find $src -type f | egrep -v "create-symlinks.sh|delete-local-config.sh|README.md")
do
    echo "rm $f"
    set +e
    rm $f
    set -e
done