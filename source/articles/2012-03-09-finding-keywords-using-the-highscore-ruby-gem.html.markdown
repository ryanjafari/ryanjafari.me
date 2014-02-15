---
title: Finding keywords using the Highscore Ruby gem
author: carlos
date: 2012-03-09 01:19 -05:00
tags: development
---

I recently discovered a really handy gem called Highscore which makes it extremely simple to find and rank keywords in a string or body of text. The gem creator [Dominik Liebler](https://github.com/domnikl) has been very receptive to suggestions and enhancements and I find myself using it quite a bit. My favorite use case is adding tags to blog posts-- just pass the blog body to the gem and it'll spit out the most relevant keywords from the content. I added support for custom regular expressions (accepted and merged into the latest version) so you can hone in on any type of keyword you want.

Check it out here: <https://github.com/domnikl/highscore>
