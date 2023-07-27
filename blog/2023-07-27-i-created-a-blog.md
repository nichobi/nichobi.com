---
title:  'I created a blog!'
author:
- Nicholas Boyd Isacsson
date: 2023-07-27
---

## Introduction
I started writing a Mastodon post earlier today, and it quickly grew too large for Mastodon's post limit. Naturally, instead of simply posting it as a thread, I spent most of my day rewriting my website to support blog posts.

The world of blogging is very much new to me. I've read countless blogposts over the years, yet never felt I had enough to say to justify having one of my own. I suppose I'm putting that to the test now, so should this blog end up inactive after the second post, don't be too surprised.

## Implementation
I decided to use [pandoc](https://pandoc.org/) as a static site generator, mainly because it's incredibly versatile (far beyond what I need), stable, and (most important of all) is written in Haskell, a language I love.

I haphazardly converted my previous website's main file [home.html](https://github.com/nichobi/website/blob/352b0c23f36b017b7d09e64f0045d90bbd2a8be1/home.html), into a [pandoc template](https://github.com/nichobi/website/blob/1c2d4731727c8e3a97dc7a516552306b41542f55/template.html) and a [markdown file](https://github.com/nichobi/website/blob/1c2d4731727c8e3a97dc7a516552306b41542f55/home.md), which when combined create (almost) the same site as before. If you want to see the full, surprisingly simple conversion, check out [this commit](https://github.com/nichobi/website/commit/1c2d4731727c8e3a97dc7a516552306b41542f55) in my website's git repository.

The neat thing about this is that it's now much easier for me to create new pages on my site. Using the same template, I now only need to write a markdown file of my post and pandoc will spit out a nicely formatted HTML file. For now, I've written a simple shell script to compile all the pages, but in the future I intend to migrate it to a Haskell script, utilising pandoc's API rather than the command line tool.

## The Future
I have a few ideas of things I could write about on here, I can't promise I'll post with any regularity at all. There's at least on post that should be coming up shortly (the overlong Mastodon post that lead to the blog's creation), but after that who knows?

I also have some more technical stuff to work out, like RSS feeds and an automated index page (at time of writing there isn't an index page whatsoever, but hopefully there'll be a handmade one by the time you read this).

I welcome any feedback, please check the sidebar for a bunch of ways to get in touch.

Thanks for stopping by!

