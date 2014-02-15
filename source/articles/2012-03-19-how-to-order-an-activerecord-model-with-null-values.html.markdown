---
title: How to order an ActiveRecord model with null values
author: carlos
date: 2012-03-19 20:22 -05:00
tags: development
---

Have you ever wanted to order an ActiveRecord model based on a column that is allowed to have null values? A typical example is a blog with a `Post` model that has a `published_at` date which is null when the `Post` has not been published yet. Let's assume our goal is to sort these records such that we have all unpublished `Posts` first followed published ones in descending order of the published date.

READMORE

To achieve this ordering, we can use the following in the `order` clause:

```ruby
# nil, 2012-3-19, 2012-3-18 ... etc.
Post.order("published_at is null DESC, published_at DESC")
```

The `published_at is null DESC` will first order all `Posts` with a null published date on the top. The `published_at DESC` will then order the `Posts` with a non-null published date in descending order.

You can also do the reverse:

```ruby
# 2012-3-18, 2012-3-19, nil ... etc.
Post.order("published_at is null ASC, published_at ASC")
```

This will result in published records being first in ascending order followed by unpublished ones.

In my experience, this works for both SQLite and PostgreSQL databases.
