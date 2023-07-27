#!/bin/sh
scriptlocation=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
[ "$scriptlocation" = "$PWD" ] || (echo "Current directory isn't the same as the script's loctaion, exiting to avoid clobbering other files" && exit 1)

pandoc_args="$*"

build() {
  filename="${1%.*}"
  pandoc --standalone --toc=true --template=template.html $pandoc_args "$1" -o "out/$filename.html"
}

rm -r out/
cp -r --reflink=auto assets out

build home.md

echo Build complete

