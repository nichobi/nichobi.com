#!/bin/sh

build() {
  filename="${1%.*}"
  pandoc --standalone --toc=true --template=template.html "$1" -o "out/$filename.html"
}

cp -r --reflink=auto assets out

build home.md

