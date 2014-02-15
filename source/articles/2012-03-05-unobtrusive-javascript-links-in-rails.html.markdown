---
title: Unobtrusive JavaScript Links in Rails
author: carlos
date: 2012-03-05 09:45 -05:00
tags: development
---

One thing that puzzled me when using the `link_to` helper to generate a link whose `click` event I knew would be handled via unobtrusive JavaScript (UJS) was what to specify as the source of the link. I tried many combinations: `nil`, the empty string, an empty anchor but none seemed correct.

I recently picked up a nice trick from Ryan Bates's [NestedForm](https://github.com/ryanb/nested_form) gem. For his UJS links, he sets the link source to `javascript:void(0)`. I like this because (1) even without a UJS handler, the link won't do anything when clicked and (2) when looking at the markup, I can now clearly see when a link will be handled via UJS.
