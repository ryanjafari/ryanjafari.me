---
title: Filtering internal traffic from Google Analytics
author: carlos
date: 2012-01-03 00:00 -05:00
tags: development
---

Google Analytics provides a wealth of useful information about a website's visitors, but sometimes the data can be skewed by your own internal traffic on the site. For this reason it's a good idea to create a filter which will exclude any visits from your machine from all of Google's reports and statistics.

According to the [Google Analytics support documentation](http://support.google.com/googleanalytics/bin/answer.py?hl=en&answer=55481), one way to accomplish this is by using JavaScript to set a cookie on all internal computers which need to be filtered out. I'll show you how to do it using Rails 3.x below.

READMORE

* * *

First add a new route for adding the cookie. My route is based off a resource I call an `AnalyticsCookie` so I can use the resource-style route syntax. I also prefer to add an `Admin` namespace to have a clear separation between forward-facing and administration areas of the site.

```ruby
# Add to routes.rb
namespace :admin do
  resource :analytics_cookies, :only => :new
end
```

Next create a new controller corresponding to the `AnalyticsCookie` resource. The controller will have a single action called `new`.

```ruby
class Admin::AnalyticsCookiesController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "secret"
end
```

I recommend adding some sort of authentication to limit access to only authorized users. Rails 3.1 makes this quite easy to do using the `http_basic_authenticate_with` method. The `new` action will render its corresponding view template inside `views/admin/analytics_cookies/` where a simple message is displayed.

```html
h1 Cookie was added!
```

The last thing to do in our Rails application is add the JavaScript code to create the cookie. This is done when the HTML `body` element is loaded. I created a new layout file specifically for the `AnalyticsCookiesController` and added the JavaScript inline.

```haml
doctype 5
html
  head
    title Internal Traffic Cookie
    = csrf_meta_tags
    meta[name='robots' content='noindex']
  body onLoad="javascript:_gaq.push(['_setVar', 'do_not_track_internal_traffic']);"
    = yield
```

As you can see, the script sets a new Google Analytics cookie with the content 'do_not_track_internal_traffic'; you can make the content anything you want.

The final step is to go to Google Analytics and create a new Filter to exclude any visitor who has the internal traffic cookie. To do this, you will need to:

1. Sign in to Google Analytics and navigate to your site's settings
2. Create and name a new Custom Filter
3. Set the Filter Field to "User Defined" and enter your cookie's content (e.g.: 'do_not_track_internal_traffic') as the Filter Pattern

Navigate to the `admin/analytics_cookies/new` route using every computer you wish you exclude and you're all set!

* * *

Here are a few things to keep in mind:

* Make sure that the page which sets the custom cookie also contains the standard Google Analytics code snippet
* Google Analytics will only filter out _new_ internal traffic from its reports-- previous internal traffic data will still be present.
* Slim is an HTML templating engine very similar to Haml. Check out the [Slim Documentation](http://rdoc.info/github/slim-template/slim) if you have any trouble understanding the view templates.
