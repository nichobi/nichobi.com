#!/bin/sh
scriptlocation=$(cd -- "$(dirname -- "$0")" && pwd)
if [ "$scriptlocation" != "$PWD" ]; then
  echo "Current directory isn't the same as the script's loctaion, exiting to avoid clobbering other files"
  exit 1
fi

build() {
  filename="${1%.*}"
  pandoc --standalone --toc=true --template=template/template.html "$@" -o "out-temp/$filename.html"
}

cp -r --reflink=auto assets out-temp/

build home.md "$@"

cp ascii/ascii.head.md ascii/ascii.md
cat ascii.txt >> ascii/ascii.md
echo '```' >> ascii/ascii.md
build ascii/ascii.md "$@"
rm ascii/ascii.md

build blog/index.md "$@" \
  -M ogimagedomain="https://blog.nichobi.com"
for post in blog/20*.md; do
  postid=$(basename "${post%.*}")
  date=$(echo "$postid" | cut -c1-10)
  ./commentstohtml.sh "$postid"
  build "$post" "$@" \
    -M date="$date" \
    -M link="https://blog.nichobi.com/$postid" \
    -M revisionurl="https://github.com/nichobi/website/commits/main/$post" \
    -M ogimagedomain="https://blog.nichobi.com" \
    -A blog/"$postid"-comments.html
done

pandoc-rss -s -l "https://blog.nichobi.com" -f '%s' \
  -t "nichobi's blog" -d "Blog by Nicholas Boyd Isacsson" \
  -w "nicholas@isacsson.se (Nicholas Boyd Isacsson)" \
  blog/20*.md \
  > out-temp/blog/feed.xml

mv out out-old
mv out-temp out
rm -r out-old/

echo Build complete

