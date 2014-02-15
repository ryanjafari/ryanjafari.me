---
title: Gotcha while using pjax + ClientSideValidations
author: carlos
date: 2012-05-14 10:15 -05:00
tags: development
---

If you are using [pjax](http://pjax.heroku.com/) along with [ClientSideValidations](https://github.com/bcardarella/client_side_validations) then you may have noticed that the two don't seem to play well together. Specifically, if your CSV-enabled form is inside a section of content that gets loaded with pjax then the validations won't function, even though they work fine if you load the page normally without pjax.

The problem and solution are documented [here](https://github.com/bcardarella/client_side_validations/issues/248) on the client_side_validations GitHub Issue tracker. In short, the CSV event handlers are bound to the ```$(document).ready()``` event, an event which is never called when content is loaded via pjax.

The solution is simple, and just requires hooking into the ```pjax:end``` event to manually trigger the CSV initialization. It looks something like this (in CoffeeScript):

```coffeescript
$ ->
  $('[data-pjax-container]').live "end.pjax", ->
    $('form[data-validate]').validate();
```

With that you should be good to go!
