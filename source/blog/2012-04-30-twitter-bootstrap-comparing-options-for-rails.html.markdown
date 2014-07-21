---
title: 'Twitter Bootstrap: Comparing Options For Rails'
date: 2012-04-30 22:38 -05:00
tags: bootstrap-and-rails
---

So we've jumped on the Bootstrap bandwagon and I do offer my sincerest apologies: it is in fact a great front-end framework: very easy to use, good looking, and well implemented. Recently we needed to figure out what Rails gem we were going to use for TBS integration. Before I give you our notes, you'd do well to take a look at the following resources: the official [Batescast](http://railscasts.com/episodes/328-twitter-bootstrap-basics) (the premium episode is also good, describing SimpleForm integration with TBS, etc.) and [this](http://rubysource.com/twitter-bootstrap-less-and-sass-understanding-your-options-for-rails-3-1/) article on TBS gem options. Running through all of this, I wrote up these notes:

READMORE

`twitter-bootstrap-rails`

- Presented by Mr. Bates in his Railscast. In the premium Railscast he goes through swapping over to `bootstrap-sass`, which can be useful if you prefer to customize TBS in Sass instead of LESS.
- Works directly with LESS & the asset pipeline.
- Offers nice Rails generators to get you started (helping you generate certain TBS layouts like fixed-width or fluid).
- Doesn't come with a test suite.
- Wondering on the performance hit of the wrapper code required to get LESS to work (since it is JS-based). In the RubySource article above, the author mentions it's not that much of an issue.

`less-rails-boostrap`

- The RubySource article author seems to prefer this one.
- Offers a test suite.
- Otherwise seems to be very similar to the above and employs the same approach.

`sass-twitter-boostrap`

- Is not actually a gem.
- It is translated Twitter LESS code => Sass source
- Requires manually copying files into your project. A maintenance headache for upgrading.
- Delay between time a new version of TBS is released and the translated code is updated.
- Allows you to use Sass.

`bootstrap-sass-gem`, `bootstrap-rails-gem`

- Gems that use translated Sass in a Rails engine to avoid maintenance headache described above.
- Delay between time a new version of TBS is released and the translated code in this gem is updated.
- Allows for Sass style authoring.

Note about future TBS upgrades: Regardless of which implementation chosen (LESS or Sass), there will always be lag time between a TBS source update and a gem update (shorter for LESS, longer for Sass).

### Overall Options

- Using the original LESS code via a Rails engine (less-rails-bootstrap or twitter-bootstrap-rails)
- Copying in translated Sass code directly into your application (sass-twitter-bootstrap), or...
- Using a translated Sass version via a Rails engine (bootstrap-sass or bootstrap-rails).

### Our Decision

We've found that so far, rare is it that we make customizations to TBS. After all, part of the beauty (and point) of TBS is using it as it stands, with light customization. So far we've customized very little things save colors, so we don't feel the need for a translated into Sass solution. We are fine to do a little LESS, but of course if there ever came a time for major work, we would prefer the ability to work within Sass syntax. As for now though, we've gone with `twitter-boostrap-rails`.
