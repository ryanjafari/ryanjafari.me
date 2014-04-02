---
title: Gotcha with HTML definition lists (DLs) and Bootstrap 3's 'dl-horizontal' class
date: 2014-04-01 22:13 EDT
tags: bootstrap-and-rails
---

[Carlos E. Ramirez III](http://www.linkedin.com/in/carlosramireziii) today gives me a heads-up regarding a gotcha with HTML DLs:

<blockquote>
  <p>"When you use DLs, you have to ensure there is some sort of content in every DD, otherwise the browser will render it out of order."</p>
</blockquote>

READMORE

I discovered that this seems to be some quirkiness with Twitter Bootstrap 3 and its `dl-horizontal` CSS class (the "issue" does not apply to DLs that do not have this class applied).

I'm unsure if the Bootstrap team expects this behavior or not, but for us it was undesirable. Let me show you what I mean:

In this example, I want to omit my age. But doing it like so is bad:

```html
<dl class='dl-horizontal'>
<dt>Name</dt>
<dd>Ryan Jafari</dd>
<dt>Age</dt>
<dd></dd>
<dt>Weight</dt>
<dd>165</dd>
</dl>
```

...and renders as:

<div class='well well-sm'>
    <dl class='dl-horizontal'>
        <dt>Name</dt>
        <dd>Ryan Jafari</dd>
        <dt>Age</dt>
        <dd></dd>
        <dt>Weight</dt>
        <dd>165</dd>
    </dl>
</div>

Notice there was no content for "Age", so the "Weight" content gets pushed up. I wonder if I would ever even want to be 165 years old.

To "fix" this, simply add a blank (or some other placeholder) to the empty `dd`:

```html
<dl class='dl-horizontal'>
<dt>Name</dt>
<dd>Ryan Jafari</dd>
<dt>Age</dt>
<dd>&nbsp;</dd>
<dt>Weight</dt>
<dd>165</dd>
</dl>
```

Voilà:

<div class='well well-sm'>
    <dl class='dl-horizontal' style='margin-bottom:0;'>
        <dt>Name</dt>
        <dd>Ryan Jafari</dd>
        <dt>Age</dt>
        <dd>&nbsp;</dd>
        <dt>Weight</dt>
        <dd>165</dd>
    </dl>
</div>

All is well in the world. But one more thing!

If you're doing the Bootstrap + Rails thing like we always are, check out this definition list helper courtesy of Carlos:

```ruby
def definition_list_pair(model, attr_name, options={})
    label = options[:label] || attr_name.to_s.titleize
    value = options[:value] || model.send(attr_name)
    value = '-' unless strip_tags(value).presence
    content_tag(:dt, label) + content_tag(:dd, value)
end
```

And use it in your views like so:

```erb
<dl class='dl-horizontal'>
    <%= definition_list_pair tour, :published? %>
    <%= definition_list_pair tour, :price, label: 'Base Price' %>
    <%= definition_list_pair tour, :active, value: 'TODO' %>
    <%= definition_list_pair tour, :description %>
</dl>
```

Not bad, right?
