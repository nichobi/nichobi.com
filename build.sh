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
build 404.md "$@"

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
  link="https://blog.nichobi.com/$postid"
  ./commentstohtml.sh "$postid"
  build "$post" "$@" \
    -M date="$date" \
    -M link="$link" \
    -M revisionurl="https://github.com/nichobi/website/commits/main/$post" \
    -M ogimagedomain="https://blog.nichobi.com" \
    -A blog/"$postid"-comments.html
done

if [ -d "blog/wip" ]; then
  mkdir -p "out-temp/blog/wip"
  for post in blog/wip/*.md; do
    date=$(date +%F)
    build "$post" "$@" \
      -M date="$date" \
      -M ogimagedomain="https://blog.nichobi.com"
  done
fi

pandoc-rss -s -l "https://blog.nichobi.com" -f '%s' \
  -t "nichobi's blog" -d "Blog by Nicholas Boyd Isacsson" \
  -w "nicholas@isacsson.se (Nicholas Boyd Isacsson)" \
  blog/20*.md \
  > out-temp/blog/feed.xml

if [ -d out ]; then
  mv out out-old
  mv out-temp out
  git --no-pager diff --no-index out-old out
  rm -r out-old/
else
  mv out-temp out
fi

echo Build complete

