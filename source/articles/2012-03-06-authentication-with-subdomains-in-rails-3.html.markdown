---
title: Authentication with subdomains in Rails 3
author: carlos
date: 2012-03-06 20:48 -05:00
tags: development
---

Subdomains have become fairly common in the web application / software-as-a-service (SaaS) world, and thanks to DHH we all know [how to implement them in Rails](http://37signals.com/svn/posts/1512-how-to-do-basecamp-style-subdomains-in-rails). What I'd like to share with you is how I implemented subdomain authentication using the [Sorcery gem](https://github.com/NoamB/sorcery) in my latest Rails project.

READMORE

### Sorcery or Devise?

I decided to go with the Sorcery gem because it offered a less intrusive authentication solution than other frameworks; all the controllers, models, and views are built by hand and the gem just adds a few necessary methods to provide the authentication functionality. If you want to use Devise instead, Dave Kennedy wrote a similar [tutorial](http://rubysource.com/basecamp-like-subdomains-with-devise) over at RubySource.

That being said, here is the (truncated) setup for my models:

```ruby
class Account < ActiveRecord::Base
  has_one :user
  attr_accessible :name
end

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  belongs_to :account
  attr_accessible :email, :password
end
```

The subdomain name is specified by the `name` attribute of the `Account` model, and the user's credentials and authentication are handled by the `User` model.

### The Simple Case

Below is the `SesssionsController` responsible for authenticating and logging in a user. Putting subdomains aside for a moment, this is how simple it is to authenticate a user:

```ruby
class SessionsController < ApplicationController
  def create
    user = login(params[:email], params[:password])
    if user
      redirect_back_or_to root_url
    else
      flash.now.alert = "Login failed."
      render :new
    end
  end
end
```

If all we wanted to do was provide simple authentication of subdomain users, then we'd need nothing more than a simple check to make sure that the user who is trying to log in is doing so on the correct subdomain account. Inside of the `create` action, we'll now check the following expression:

```ruby
if user && @current_account.try(:user) == user
```

This will ensure that a user from one account can't log in with their valid credentials to another account.

### Advanced Case

Suppose you want to provide a login page where the user can specify both his/her credentials as well as the account he/she wants to log in to (e.g. [this](http://groovehq.com/users/sign_in) type of login page from Groove). This is quite useful if you want to add a general "login" link to your app's homepage.

First we need to modify the `SessionsController` to determine the `@current_account` either by the request's subdomain parameter *or* by the account name parameter passed to the request by the user. This is as simple as overriding the `set_current_account` method (you did follow [DHH's post](https://37signals.com/svn/posts/1512-how-to-do-basecamp-style-subdomains-in-rails) didn't you?)

```ruby
def set_current_account
  @current_account = Account.find_by_name(request.subdomains.first) ||
    Account.find_by_name(params[:subdomain])
end
```

Now in order for the authentication to work properly we need to enable cookies to be shared across all subdomains otherwise the authentication won't be valid when we navigate to any account-specific pages. Luckily this is quite easy in Rails 3. Inside of the `session_store.rb` initializer, append the `:domain => :all` option to the `config.session_store` declaration. It should look something like this:

```ruby
App::Application.config.session_store :cookie_store, key: '_app_session', domain: :all
```

The final step is very important: now that we are sharing cookies across subdomains, we need to make sure that no currently logged-in user tries to access another account. We will do so by overriding Sorcery's `require_login` method and inserting the check for this condition:

```ruby
def require_login
  # Make sure that the currently logged in user isn't accessing another account
  if logged_in? && @current_user != @current_account.user
    not_authenticated()
  else
    super
  end
end
```

With that your users should be able to login using both the account-specific login page as well as the general login page (assuming they can remember their account name-- a topic for another post).
