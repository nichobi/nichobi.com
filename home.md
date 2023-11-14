---
pagetitle:  'home of nichobi - Nicholas Boyd Isacsson'
title:  "nichobi's home"
description: "Nicholas Boyd Isacsson's homepage, hub and project list, including programming, ASCII art and Linux stuff."
link: "https://nichobi.com"
---

  Hello! I'm Nicholas Boyd Isacsson (nichobi for short) and this is my homepage.
  The site consists of three main pages:

  - This homepage, giving a quick overview of some of my projects. If you want further details, follow the links to github.
  - A [collection of my ASCII art](https://ascii.nichobi.com), containing (almost) everything I've drawn on one page, sorted from newest to oldest.
  - A [blog](https://blog.nichobi.com), where I'm writing rather freely about what's on my mind.

  Since 2016 I've had a keen interest in functional programming, first awakened by Scala and over time also in Haskell.
  Most of my projects tend to be terminal-based utilities for Linux servers, motivated by a mix of solving my own problems and wanting to learn more about some new tool or framework.

<div class="hflex">
## Scalarr
\[[git](https://github.com/nichobi/scalarr)\]
</div>

  ![Short demo of Scalarr functionality](scalarr.gif)

  Scalarr is a command line tool for communicating with [Sonarr](https://sonarr.tv/), written in Scala.
  I initially developed it to get the hang of REST APIs and IO monads, for which I made heavy use of [ZIO](https://zio.dev/).
  It features a simple command line interface, and uses (a slightly modified) [TerminalImageViewer](https://github.com/stefanhaustein/TerminalImageViewer) to display posters in a low-res but very cool and mostly identifiable way.

<div class="hflex">
## beets-yapl
\[[git](https://github.com/nichobi/beets-yapl)\]
</div>

  ![Terminal output demoing how beets-yapl converts its playlist format to M3U](beets-yapl.png)

  beets-yapl (yaml playlist) is a plugin for the [beets](https://github.com/beetbox/beets) media manager.
  It was built out of frustration with the M3U playlist format, which breaks at the slightest change in filepaths.
  After years of fruitless searching for a better playlist format, I realised I was going to have to invent one myself.
  I ended up finding yaml to be an excellent starting point, with a clear and concise syntax, and from there I just needed to decide how playlist were expressed.

  Leveraging beets' powerful query engine, songs can be described as a list of fields and values, consisting of whatever metadata required to unambiguously pinpoint a single file in the library.
  This means you can construct your playlists by song title and artists, MusicBrainz ids, release year, or any other of beets many fields, in whatever combination you like.
  beets-yapl will then go through each query, and find generate an M3U playlist for each unambiguously defined track to be used in any music software.
  Warnings will be emitted if any query results in multiple or no results, in which case you can refine it.
  Should your library change in future, a call to beets-yapl will reconstruct the playlists with the updated paths.

<div class="hflex">
## sponsorblockcast
\[[git](https://github.com/nichobi/sponsorblockcast)\]
</div>

  A POSIX shell script that monitors all Chromecasts on the local network and automatically skips past any sponsored or otherwise unwanted segments of Youtube videos, using the [SponsorBlock](https://github.com/ajayyy/SponsorBlock) API.

  It was inspired by [CastBlock](https://github.com/stephen304/castblock) but rewritten from scratch to avoid some of its pitfalls, allowing for much greater performance and poll rates as well as extra features and configuration. Thanks to contributors, it will also automatically skip skippable ads and is available in a docker image.

<div class="hflex">
## ASCII Art
\[[git](https://github.com/nichobi/website)\]
</div>

<pre role="img" aria-label="ASCII art of male and female stag beetles">
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
</pre>

  I've been making ASCII art for a few years, in one ever-expanding document sorted from newest to oldest. It's available in full on my [ASCII site](https://ascii.nichobi.com) and if you start from the bottom you can follow my journey from its (quite ugly) beginnings. You can also browse the history of it in via the [git commits](https://github.com/nichobi/website/commits/main/ascii.txt).

<div class="hflex">
## wordle
\[[git](https://github.com/nichobi/wordle)\]
</div>

  ![Short demo of playing wordle](wordle.gif)

  During the [Wordle](https://www.powerlanguage.co.uk/wordle/) mania in early 2022, I wrote a minimal terminal clone of the popular daily word guessing game by powerlanguage.
  It uses the same daily word as the original website, so everyone gets the same word each day!
  (After the accquisition by the New York Times, the word list of the game has been modified several times, putting my version out of phase.)

  It's written in Haskell and was my first time using the terminal UI library [brick](https://github.com/jtdaugherty/brick) to design a more interactive interface.

<div class="hflex">
## Dotfiles
\[[git](https://github.com/nichobi/dotfiles)\]
</div>

  My dotfiles repo contains all my configuration files for my development environment (based on neovim), Arch Linux setup (sway, zsh & more), qutebrowser and many other programs. I don't recommend copying it in its entirety, but feel free to poke around for inspiration!

<div class="hflex">
## Website
\[[git](https://github.com/nichobi/website)\]
</div>

  I made this website in an attempt to combine the style of an ascii-art webpage with some more modern features of HTML and CSS to create a website that could for the most part be rendered in a terminal, yet doesn't feel (too) antiquated.
  It started as a single file of handwritten HTML and CSS, but during the creation of my blog, it was generalised into a pandoc template, allowing me to generate a multitude of pages at once.
  You can read more about that process in my [first blog post](https://blog.nichobi.com/2023-07-27-i-created-a-blog).

  It's an intentionally bare-bones static webpage, with no JavaScript or animations as I strongly believe the internet has become a worse place as a result of increasingly bloated and ad-infested sites, when the content we're after is mostly static media.

