---
title: Adding selection checkboxes to a list
author: carlos
date: 2012-06-16 13:04 -05:00
tags: development
---

It's fairly common practice for admin consoles to include checkboxes on each row of a list view for performing actions on some rows and not others (check out [RailsAdmin](https://github.com/sferik/rails_admin) to see an example).

Implementing this functionality in a list or table turned out to be fairly simple. Here's the code (using [Slim](http://slim-lang.com/)):

```haml
table
  thead
    tr
      th
      th Name
  tbody
    - @records.each do |record|
      tr
        td= check_box_tag "selected_ids[]", record.id
        td= record.name
```

And now in my controller I am able to get an array of the selected row's object ids using ```params[:selected_ids]```. From there, I can perform whatever actions I need to using just the records which were selected in the table.
