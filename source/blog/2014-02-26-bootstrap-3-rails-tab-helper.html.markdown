---
title: Bootstrap 3 Rails Tab Helper
date: 2014-02-26
tags: bootstrap-and-rails
---

_This is part one in a series entitled "Bootstrap For Rails Front-End Developers"._

### A Quick Introduction ###

So you've stumbled upon this while doing some front-end work in a Rails project with Bootstrap. You might be more of a front-end developer than a Rails developer, and you might not exactly be 100% cozy with Rails quite yet. Or maybe you're a back-end guy that wants something to help deal with this front-end stuff as unobtrusively as possible. Either way, you're throwing down a ton of markup in your views and are looking for something to help you keep things clean.

READMORE

[Skip to the final code.](#final)

---

Even with awesome template languages like Slim, Haml, etc. Rails views can get messy. As nice as Bootstrap is, it comes with a bunch of (probably entirely necessary) markup for things like tab components that quickly litter up your views.

Being a front-end developer who spends most of his time in Rails environments, I'm extra careful not to incite the wrath of my back-end brethren by mucking things up. An important part of this is spotting places ripe for reorganization and understanding what Ruby and/or Rails tools are at your disposal to do so. There's definitely an art to looking out for repetitous markup patterns that beg for abstracting and using the right tools to clean them up.

I've written a bunch of Rails helpers for Bootstrap for a sizeable project we're working on now that meet our needs well. Why not use a gem? Most gems seem to have helpers only for the basics like nav bars, modals, and dropdowns, probably because Bootstrap changes its markup often enough that people don't want to deal with keeping the dizzying amount of components up-to-date.

I've decided to release my helpers not so much as drop-in source code ready for use, but instead primarily as a teaching tool to benefit front-end developers learning to coexist with their Rails developer counterparts under the same codebase. The idea is that through these examples, you can be confident doing what you do best (making things look and feel awesome) in a Rails-y way that keeps things modular and clean. Of course, even Rails pros are welcome to have a look around and see if any of my resources can help make life easier.

Getting the hang of writing solid, versatile helpers for your views isn't too bad. Let me show you how.

### The Bootstrap Tab Helper ###

How about this. Tabs. Bootstrap Tabs. It's a ton of markup, and sometimes getting them working properly with tabs linking to their respective panels is a brief pain in the ass. If your app happens to use tabs in a lot of places, hooking this up over and over is a drag.

So, what about a tab helper that generates the code for us and maps links to panels automatically without us worrying about #ID selectors? This way we can use tabs anywhere on our app, worry free.

When we're done, we want something that allows us to define the content of our tabs, while abstracting away all of the markup plumbing. That something might look like this:

```erb
<%= bs_tabs do |t| %>
  <%= t.bs_tab_for 'Tab 1', true do %>
    <!-- content for tab 1 goes here -->
  <% end %>
  <%= t.bs_tab_for 'Tab 2' do %>
    <!-- content for tab 2 goes here -->
  <% end %>
<% end %>
```

See what we're going for here? Sound good? Let's do it.

---

I'm going to assume some familiarity with the folder structure of a Rails project. You've probably got an `app/assets/helpers` folder in your Rails project. Let's make a new `.rb` file there called `bs_tab_helper.rb`.

Let's think about it conceptually. Our `TabHelper` module will need to instantiate a `TabCollection` which is responsible for keeping track of a list of `TabItem`s, which represent our individual tabs. Here's what that looks like:

#### Step 1 #####

```ruby
module TabHelper
  def bs_tabs(options = {}, &block)
    TabCollection.new(options)
  end

  class TabCollection
    def initialize(options)
      @tab_items = []
      @options = options
    end

    def bs_tab_for(title, active = false, &block)
      tab_item = TabItem.new(title, 'default content', active)
      @tab_items << tab_item
    end
  end

  class TabItem
    def initialize(title, content, active = false)
      @title = title
      @content = content
      @active = active
    end
  end
end
```

This is a start, but it won't do anything cool yet. Let's explain.

When our view does `<%= bs_tabs do |t| %>` it instantiates `t` with a new instance of `TabCollection`. This is key, because when we do `<%= t.bs_tab_for 'Tab 1' do %>` to specify a tab and its content, a `TabItem` with the appropriate `title`, `content`, and `active` flag (for specifying which tab should be highlighted and selected initially) will be added to the `@tab_items` array that the `TabCollection` class uses to keep track of all of our tabs.

> - The `@options` hash that you see there is a common way to pass over custom CSS classes and other HTML attribute options that you might want applied to the tab wrapper.
> - For simplicity in the first step we've made every tab have a content of the text `'default content'`, but obviously we're going to want to change this shortly.
> - The `@active` variable lets a `TabItem` know if it is highlighted with the Bootstrap `active` class or not.

---

In order for us to be able to create `TabItem`s with the content that we pass as a block to the `bs_tab_for` method (remember, this is the actual content of the tab), we need to make use of a special Rails method called `capture`. `capture` takes a block as an argument and returns a `String`-like object that we can do stuff with. Wild.

The thing is, the `capture` method is only available to us from a Rails `ActionView` context. When we're in an ERB file or a Rails view helper, we automatically have access to it, as Rails does some magic that allows us to call `capture` without any special handling. Since we don't have access to a view context with our little `TabCollection` class, we'll need to pass a reference to it from the `bs_tabs` method directly under the definition of the `TabHelper` module, which *does* have access to one. Check it out:

#### Step 2 ####

```ruby
module TabHelper
  def bs_tabs(options = {}, &block)
    TabCollection.new(self, options)
  end

  class TabCollection
    def initialize(view, options)
      @view = view
      @tab_items = []
      @options = options
    end

    def bs_tab_for(title, active = false, &block)
      tab_item = TabItem.new(title, @view.capture(&block), active)
      @tab_items << tab_item
    end
  end

  # ...
end
```

What's different? Well, we have now constructed our `TabCollection` with a reference to the view context obtained via `self` in the `bs_tabs` method. Then, we make use of this, loaded into the instance variable `@view`, to change what we pass as `content` in the `TabItem` constructor to the actual tab content we pass as a block to `bs_tab_for` in our view (instead of the dummy text we were using before). That's accomplished using the `capture` method on the view context as such: `@view.capture(&block)`.

So far, so good. Let's move onto talking about the stuff that generates the correct Bootstrap HTML markup for our tabs.

---

The way we want to think of this is that each of our two classes, `TabCollection` and `TabItem`, should know how to render themselves, and be completely oblivious to how the other is rendered. That way, when we ask our `TabCollection` what its HTML markup looks like so that we can render our tabs, it will ask each of its `TabItem`s what their HTML markup looks like. `TabItem`s will return their HTML markup to the `TabCollection`, and `TabCollection` will return all of that, plus its own stuff, to us.

Isn't it beautiful to leverage object-oriented programming principles when tackling real-world problems? Yes, it is.

Let's start off with taking a look at how a `TabItem` will render itself:

#### Step 3 #####

```ruby
module TabHelper
  # ...

  class TabItem
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::UrlHelper

    def initialize(title, content, active = false)
      @id = SecureRandom.uuid
      @title = title
      @content = content
      @active = active
    end

    def li
      @li ||= content_tag(:li, link, class: ('active' if @active))
    end

    def pane
      @pane ||= begin
        pane_options = {
          class: "tab-pane #{'active' if @active}",
          id: @id
        }
        content_tag(:div, @content, pane_options)
      end
    end

    protected

    def link
      link_to @title, "##{@id}", data: { toggle: 'tab' }
    end
  end
end
```

First, we want each `TabItem` to have a unique ID (Bootstrap requires this for its tab linking to work). `SecureRandom.uuid` guarantees us a unique string, and that's all we care about right now, so we set an `@id` property equal to one of those for later use. Great.

As you can observe from Bootstrap tab markup, each tab consists of one `<li>`, which functions as the clickable tab link, and one `<div class='tab-pane'>`, which functions as the tab content area. Thus the methods `li` and `pane`.

Let's take a look at the `li` method. It uses another view method called `content_tag` which generates HTML markup for us for the specified tag type (in this case, the symbol `:li` is used to indicate an HTML `<li>` element). To use `content_tag`, we'll import the `ActionView::Helpers::TagHelper` module. By the way, the same deal applies for the `ActionView::Helpers::UrlHelper` import since we use `link_to` in the `link` method, which we talk about next.

> We could have passed the view context to a `TabItem` instead of importing these, but it turns out to be very expensive performance-wise to do that, especially since we can potentially have many, many tabs on one page. It turns out that importing or "mixing in" these two modules provides us with the methods we need without the performance overhead of passing the view around. And that's good enough for us.

We pass the `link` method as the second argument to the `content_tag` method to specify its return value as the tag's content. As you can see, `link` generates the Bootstrap tab link with the proper ID and data attributes. We declare the `link` method as protected because nobody but the `TabItem` class should use it, whereas the `li` and `pane` methods will be used by the `TabCollection` class in order to render everything, but more on that in a bit. Finally, the third parameter to `content_tag` allows us to specify some HTML attributes such as `class` and `data` that we'll need for Bootstrap tabs. If you're familiar with Bootstrap you're familiar with these.

The `pane` method is pretty self explanatory at this point. We just set up the HTML attributes in `pane_options` and pass `content_tag` `:div` for the tag type, `@content` for the tab's content, and `pane_options` for the tag's HTML attributes.

> You'll notice the `@var ||= ...` syntax in the above step. Basically it means "If the variable is nil, load it up with what comes after. If it already has something in it, leave it alone." Adding `begin` simply allows you to load the variable up with the result of a block if your initialization of `@var` requires multiple lines.

---

So now our `TabItem` knows how to render itself. Awesome... we are so close. Now to let `TabCollection` know how to do similarly:

#### Step 4 ####

```ruby
module TabHelper
  def bs_tabs(options = {}, &block)
    TabCollection.new(self, options)
  end

  class TabCollection
    delegate :content_tag, to: :view

    def initialize(view, options)
      @view = view
      @tab_items = []
      @options = options
    end

    def render
      defaults = { class: 'nav nav-tabs' }
      tab_links = content_tag(:ul, li_content, defaults.update(@options))
      tab_content = content_tag(:div, pane_content, class: 'tab-content')
      tab_links + tab_content
    end

    def bs_tab_for(title, active = false, &block)
      tab_item = TabItem.new(title, @view.capture(&block), active)
      @tab_items << tab_item
    end

    protected

    attr_reader :view

    def li_content
      @tab_items.collect(&:li).join.html_safe
    end

    def pane_content
      @tab_items.collect(&:pane).join.html_safe
    end
  end

  # ...
end
```

`li_content` and `pane_content` both go through the `@tab_items` array and grab the result of each `TabItem`'s `li` and `pane` methods, respectively (that's what `@tab_items.collect(&:var)` does). `join` concatenates the resulting arrays into strings and `html_safe` ensures that Rails will display the strings as rendered HTML and not just plain text. Finally, we put the `li_content` and `pane_content` methods under the `protected` block since no one but the `TabCollection` class should access them.

> You'll notice a `attr_reader :view` call here. This is required to support `delegate :content_tag, to: :view` found at the top of the `TabCollection` class. Since we already have access to the view context through `@view` to support the `capture` method, we don't have to import the `ActionView::Helpers::TagHelper` module as we did earlier, since the method we need there is already available to us using `@view`. The `delegate` method here allows `@view` to handle all `content_tag` calls that we make. Nice, Rails!

Onto the method that puts it all together: `render`. First, our usual HTML classes setup. Then, we create the main `ul` element that will contain all of the `<li>` tags for the tab links that we built up as returned by `li_content`. We load this all up in the `tab_links` variable.

> `defaults.update(@options)` updates the default HTML attributes we have in the `defaults` hash with those we've specified in `@options` if we've elected to customize the standard set. It might look something like this in ERB if we want to, say, update the look with a custom CSS class: `<%= bs_tabs class: 'something' do |t| %>`.

`tab_content` will be a `<div>` with the appropriate Bootstrap class containing all of the tab content panes we've built up as returned by `pane_content`.

Concatenate `tab_links` and `tab_content` and we've completed our `render` method.

---

Just one final step, since we haven't actually called render yet:

#### Step 5 ####

```ruby
module TabHelper
  def bs_tabs(options = {}, &block)
    h = TabCollection.new(self, options)
    capture(h, &block)
    h.render
  end

  # ...
end
```

What `capture(h, &block)` does for us here is ensure the entire block that is passed to it is evaluated. We need this to happen because the block we pass via `<%= bs_tabs do |t| %>` will have one or more `<%= t.bs_tab_for do %>` calls with their own blocks.

Calling `h.render` will output the actual HTML content. Done.

---

#### <a name='final'></a> Final Product ####

```ruby
module TabHelper
  def bs_tabs(options = {}, &block)
    h = TabCollection.new(self, options)
    capture(h, &block)
    h.render
  end

  class TabCollection
    delegate :content_tag, to: :view

    def initialize(view, options)
      @view = view
      @tab_items = []
      @options = options
    end

    def render
      defaults = { class: 'nav nav-tabs' }
      tab_links = content_tag(:ul, li_content, defaults.update(@options))
      tab_content = content_tag(:div, pane_content, class: 'tab-content')
      tab_links + tab_content
    end

    def bs_tab_for(title, active = false, &block)
      tab_item = TabItem.new(title, @view.capture(&block), active)
      @tab_items << tab_item
    end

    protected

    attr_reader :view

    def li_content
      @tab_items.collect(&:li).join.html_safe
    end

    def pane_content
      @tab_items.collect(&:pane).join.html_safe
    end
  end

  class TabItem
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::UrlHelper

    def initialize(title, content, active = false)
      @id = SecureRandom.uuid
      @title = title
      @content = content
      @active = active
    end

    def li
      @li ||= content_tag(:li, link, class: ('active' if @active))
    end

    def pane
      @pane ||= begin
        pane_options = {
          class: "tab-pane #{'active' if @active}",
          id: @id
        }
        content_tag(:div, @content, pane_options)
      end
    end

    protected

    def link
      link_to @title, "##{@id}", data: { toggle: 'tab' }
    end
  end
end
```

Use it like this:

```erb
<%= bs_tabs do |t| %>
  <%= t.bs_tab_for 'Tab 1', true do %>
    <!-- content for tab 1 goes here -->
  <% end %>
  <%= t.bs_tab_for 'Tab 2' do %>
    <!-- content for tab 2 goes here -->
  <% end %>
<% end %>
```

