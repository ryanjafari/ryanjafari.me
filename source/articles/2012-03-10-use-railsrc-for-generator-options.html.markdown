---
title: Use .railsrc for generator options
author: carlos
date: 2012-03-10 14:25 -05:00
tags: development
---

I just noticed an interesting message in the description of the `rails new` generator help documentation:

> You can specify extra command-line arguments to be used every time 'rails new' runs in >the .railsrc configuration file in your home directory.

I tracked down [this commit](https://github.com/rails/rails/pull/2583) in the Rails source code repository and sure enough we have the ability to specify default options for the generator inside of a `.railsrc` file in the home directory!

This is great news because I always use the `--skip-bundle` option so that I can install my gems to the `vendor` directory (I've been following the advice of a [blog post](http://ryan.mcgeary.org/2011/02/09/vendor-everything-still-applies/) entitled _"Vendor Everything" Still Applies_).
