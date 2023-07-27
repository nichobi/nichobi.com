---
pagetitle:  'home of nichobi - Nicholas Boyd Isacsson'
description: "Nicholas Boyd Isacsson's homepage, hub and project list, including programming, ASCII art and Linux stuff."
---

## Hello! {#hello}

  I'm Nicholas Boyd Isacsson (nichobi for short) and this is my webpage to serve as a hub for all my projects and various other interests. Since 2016 I've had a keen interest in functional programming, first awakened by Scala and lately also in Haskell. Most of my projects tend to be terminal-based utilities for my Linux server, and usually based around some concept I want to improve my skills at.

  Look below for quick overviews on some of my projects, and follow the links to github for further details.

## Scalarr
\[[git](https://github.com/nichobi/scalarr)\]

  ![Short demo of Scalarr functionality](https://raw.githubusercontent.com/nichobi/scalarr/master/scalarr.gif)

  Scalarr is a command line tool for communicating with [Sonarr](https://sonarr.tv/), written in Scala.
  I initially developed it to get the hang of REST APIs and IO monads, for which I made heavy use of [ZIO](https://zio.dev/).

## beets-yapl
\[[git](https://github.com/nichobi/beets-yapl)\]

  ![Terminal output demoing how beets-yapl converts its playlist format to M3U](beets-yapl.png)

  beets-yapl (yaml playlist) is a plugin for the [beets](https://github.com/beetbox/beets) media manager. It was built out of frustration with the M3U playlist format, which breaks at the slightest change in filepaths. After years of fruitless searching for a better playlist format, I realised I was going to have to invent one myself. I ended up finding yaml to be an excellent starting point, with a clear and concise syntax, and from there I just needed to decide how playlist were expressed.

  Leveraging beets' powerful query engine, songs can be described as a list of fields and values, consisting of whatever metadata required to unambiguously pinpoint a single file in the library. beets-yapl will then generate M3U playlists to be used in any music software.

## sponsorblockcast
\[[git](https://github.com/nichobi/sponsorblockcast)\]

  A POSIX shell script that monitors all Chromecasts on the local network and automatically skips past any sponsored or otherwise unwanted segments of Youtube videos, using the [SponsorBlock](https://github.com/ajayyy/SponsorBlock) API.

  It was inspired by [CastBlock](https://github.com/stephen304/castblock) but rewritten from scratch to avoid some of its pitfalls, allowing for much greater performance and poll rates as well as extra features and configuration.

## ASCII Art
\[[git](https://github.com/nichobi/ascii)\]

```
         .   .
        /{   }\          stag beetle
       | \, ,/ |
    ,,  \ '-' /  ,,
     \  [_   _]  /         m-,{_},-m
      \_/ ‾‾‾ \_/        ,,  (   )  ,,
       _\_____/_          \_/‾---‾\_/
      / |  |  | \          _|-----|_
     /  |  |  |  \        / |  |  | \
    ´` |\  |  /| ´`      ´`|\  |  /|´`
       | '---' |           " '---' "
       "       "
           ♂                   ♀
```

  I dabble in ascii art, see my [ascii site](https://ascii.nichobi.com) for my full, ever expanding page of drawings or check out the [Github repo](https://github.com/nichobi/ascii) to see more details about the website.

## wordle
\[[git](https://github.com/nichobi/wordle)\]

  ![Short demo of playing wordle](https://raw.githubusercontent.com/nichobi/wordle/master/wordle.gif)

  I wrote a terminal clone of the popular daily word guessing game [Wordle](https://www.powerlanguage.co.uk/wordle/) by powerlanguage. It uses the same daily word as the original website, so everyone gets the same word each day!

  It's written in Haskell and uses the terminal UI library [brick](https://github.com/jtdaugherty/brick) for its interface.

## Dotfiles
\[[git](https://github.com/nichobi/dotfiles)\]

  My dotfiles repo contains all my configuration files for my development environment (based on neovim), Arch Linux setup (sway, zsh & more), qutebrowser and many other programs.

## Website
\[[git](https://github.com/nichobi/website)\]

  I made this website in an attempt to combine the style of an ascii-art webpage with some more modern features of CSS to create a website that could be rendered in a terminal, yet doesn't feel antiquated. It's intentionally barebones, as I believe there's little reason to overcomplicate a website like this with JavaScript or flashy animations.
