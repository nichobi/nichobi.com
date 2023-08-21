---
title:  'Passing on the SponsorBlock Chromecast torch'
author:
- Nicholas Boyd Isacsson
date-meta: 2023-08-21T11:39+02:00
mastodonpost: "https://social.spejset.org/\\@nichobi/110926964692168022"
---

## First generation
In mid-2020, [stephen304](https://github.com/stephen304) developed a simple bash script called [CastBlock](https://github.com/stephen304/castblock-legacy) which leveraged the [SponsorBlock](https://sponsor.ajay.app) API and [go-chromecast](https://github.com/vishen/go-chromecast) library to monitor Chromecast devices on your local network, finding community flagged sponsor segments in the videos you watched, and tell the Chromecast to skip past them.

This first generation of SponsorBlock for Chromecast wasn't without issues.
One key issue was the expensive Chromecast polling method, which required starting a new instance of go-chromecast for every poll of the Chromecast status.
This lead to choosing between high performance costs or a low poll rate (which would mean playing several seconds of the sponsor segment before it got skipped).
It also only scanned for Chromecasts at first launch, missing any devices that happened to be offline at launch; didn't support additional SponsorBlock categories (self-promotion, interaction reminder, etc.) and was completely unconfigurable.

## Second generation

A few months later, I stumbled upon CastBlock and was wowed by the concept.
Pretty quickly though, I became unhappy with some of the faults, and started experimenting with making some minor changes.
It didn't take long before I realised these changes would require a major restructuring of the script, and I instead opted for a full rewrite.
This became [`sponsorblockcast`](https://github.com/nichobi/sponsorblockcast), a second generation SponsorBlock client for Chromecast.
A number of other clones also appeared, written in [JavaScript](https://github.com/erdnaxeli/castblock) or [PHP](https://github.com/willemstuursma/castblock-php), though for whatever reason mine seemed to be the one that garnered the [most](https://www.reddit.com/r/selfhosted/comments/11n5lm2/sponsorblockcast_amazing_selfhosted_automated/) [attention](https://noted.lol/self-hosted-roundup-31/#sponsorblockcast).

It utilised go-chromecast's `watch` command to monitor a Chromecast continuosly, getting rid of the constant new instances of go-chromecast required by castblock.
It allowed customising poll intervals, intervals for detecting new devices, and what SponsorBlock categories to skip.
While rewriting it, I also took the opportunity to move the script from bash to fully POSIX-conforming shell script, allowing it to run in more performant shells such as [dash](https://wiki.archlinux.org/title/Dash).

`sponsorblockcast` also received a multitude of [contributions](https://github.com/nichobi/sponsorblockcast/pulls?q=is%3Apr), bringing Docker support, automatically skipping YouTube adverts, macOS support, and a number of bug fixes.
Everyone who contributed has my sincerest thanks!

Still, `sponsorblockcast` was in several ways imperfect.
As a result of being a shell script and relying on go-chromecast's command line utility, it required quite a lot of calls to external programs.
A common complaint was the resource usage of the script on networks with many devices, as each device required a separate instance of go-chromecast.
As someone who generally only had one or two devices, this made little difference.
For others who had upwards of (and beyond) 10 devices, this overhead became significant.
Unfortunately, with the limitation of go-chromecast's CLI, there was no way around it.


## Third generation

There was room for improvement, and it was only a matter of time before someone wrote a version in Go, allowing access to go-chromecast as a library (in fact, when I first reached out to stephen304 about my rewrite, he mentioned wanting to do just that).
It turned out to take longer than expected for such a project to appear.
Now, over two years later, a comment was made on github and an announcement on lemmy, announcing [CastSponsorSkip](https://github.com/gabe565/CastSponsorSkip).
It lists many improvements over `sponsorblockcast`:

- Uses the SponsorBlock [enhanced privacy endpoint](https://wiki.sponsor.ajay.app/w/API_Docs#GET_/api/skipSegments/:sha256HashPrefix). When searching for sponsored segments, the video ID is hashed and only the first 4 characters of the hash are passed to SponsorBlock. This allows CastSponsorSkip to fetch segments without telling SponsorBlock what video is being watched.
- Compiles to a single binary. No dependencies are required other than CastSponsorSkip.
- Scans Cast device status much less frequently when a YouTube video is not playing, resulting in decreased CPU usage and less stress on the Cast device.
- Written Go, which is the same language as `go-chromecast`. This means `go-chromecast` functions can be called directly instead of relying on shell scripts, child commands, or string parsing.
- `go-chromecast` only needs to be loaded once within a single Go program, resulting on lower memory usage.
- Dependency updates are automated with Renovate.


## Goodbye
To me, this seems to be the long-awaited successor to `sponsorblockcast`, and I'm happy to pass on the torch, content to see the influence `sponsorblockcast` has had on CastSponsorSkip.
I'll soon be editing and archiving the `sponsorblockcast` repository to encourage people to move over.

Thanks everyone who used it, and an especially big thanks to everyone who made contributions or spread the word.
See you around!

