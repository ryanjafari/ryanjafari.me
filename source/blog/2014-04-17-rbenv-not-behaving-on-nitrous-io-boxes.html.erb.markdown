---
title: rbenv not behaving on Nitrous.io boxes
date: 2014-04-17
tags: nitrous.io
---

### Obligatory Nitrous.io review that you didn't ask for ###

Girls and boys.

Nitrous.io has been a slight bit of an adventure for me. An ambitious project
that is raising a whole boat load of money doing what it does. To the tune of
something like $6.65 million bucks.

READMORE

[Skip the BS](#solution)

Now if you're a fan of crappy pizza, that can buy you A LOT of crappy pizza.
Let's see...

<p>
    <%= image_tag '/blog/2014-04-17-rbenv-not-behaving-on-nitrous-io-boxes/johns_favorite.jpg', width: '25%', class: 'pull-right img-rounded img-left' %>
</p>

- 1x Papa John's Large Speciality Pizza = ~$15 bucks
- 6,650,000/15 = 443,333 Large Specialty Pizzas
- Which would last you, having one each day = 443,333/365 = 1,215 years
- Which would take ~16 (1,215/76) men their entire lives to eat

HOLY. 1,215 years of crappy pizza. You think you would die? I think so, probably.

But the real question here is does Nitrous.io do what it does well? Pretty much.

Syncing with the Nitrous.io desktop app for OS X is pretty slow (perhaps
understandably so) for a guy like me building apps with a save-refresh-save-refresh
workflow. This is especially the case if you're doing front-end stuff and need
to see quick feedback on visual changes. It really does take a couple seconds
too many to bear for changes to be sent from your machine to the box with your
server running on it. Our connection speed seems to be pretty good (?): 109.47 Mbps
download and 24.78 Mbps upload.

CPU and memory resource allocation on boxes is wonky. From time to time I'll
experience extreme slow downs and random out-of-memory errors. Support has been
great and they've provided suggestions, but things are still a bit flaky. Yeah
that's not really a technical assessment: take it or leave it.

*But I'm still trucking through it, because I believe in Nitrous.io and what they
hope to achieve. Bringing development environments and their clutter off our
computers and into the cloud.*

### 'the F does this have to do with rbenv? ###

<p>
    <%= image_tag '/blog/2014-04-17-rbenv-not-behaving-on-nitrous-io-boxes/wtf.jpg', width: '25%', class: 'pull-right img-rounded img-left' %>
</p>

Well the general wonkiness of Nitrous.io in its fledgling days segues nicely into
the wonkiness I was experiencing when trying to install rbenv on my box.

In short, gems were not being installed correctly into their rbenv-appropriate,
Ruby-version-prefixed folders (`~/.rbenv/versions/2.0.0/...`). No matter what
version of Ruby I was on using rbenv, all gems seemed to get installed to the
system gem directory. This kind of stuff drives me nuts, even though I could
have gone working through it, since at least the Ruby versions themselves were
changing correctly.

### <a name='solution'></a> Solution ###

Turns out those unsavory fellows over at Nitrous.io (kidding) were setting one of
the `GEM_HOME/GEM_PATH` variables (I forget which one). Some of the team over at
rbenv seem to think this is [not a good practice](https://github.com/sstephenson/rbenv/issues/259)
for Ruby-swtiching tools. I'd probably agree considering things weren't working
with those environment variables set. To be sure they ain't, and to fix your rbenv,
just pop in both of these bad boys into your `~/.bashrc` or `~/.bash_profile`
to make sure they aren't set.

```bash
# ~/.bash_rc or ~/.bash_profile

# some other BS
# ...

unset GEM_HOME
unset GEM_PATH
```
Now for some pizza. I just ordered a medium Pepperoni.

<p>
    <%= image_tag '/blog/2014-04-17-rbenv-not-behaving-on-nitrous-io-boxes/pepperoni.jpg', width: '25%', class: 'img-rounded' %>
</p>
