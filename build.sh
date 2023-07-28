#!/bin/sh
scriptlocation=$(cd -- "$(dirname -- "$0")" && pwd)
if [ "$scriptlocation" != "$PWD" ]; then
  echo "Current directory isn't the same as the script's loctaion, exiting to avoid clobbering other files"
  exit 1
fi
pandoc_args="$*"

build() {
  filename="${1%.*}"
  pandoc --standalone --toc=true --template=template.html $pandoc_args "$1" -o "out/$filename.html"
}

rm -r out/
cp -r --reflink=auto assets out

build home.md

mkdir out/blog/
for post in blog/*.md; do
  build "$post"
done

pandoc-rss -s -l "https://blog.nichobi.com" -f '%s' \
  -t "nichobi's blog" -d "Blog by Nicholas Boyd Isacsson" \
  -w "nicholas@isacsson.se (Nicholas Boyd Isacsson)" \
  blog/20*.md \
  > out/blog/feed.xml

echo Build complete

