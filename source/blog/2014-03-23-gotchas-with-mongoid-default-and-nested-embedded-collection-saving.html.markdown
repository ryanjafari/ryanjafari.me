---
title: Gotchas with Mongoid 'default' and nested, embedded collection saving
date: 2014-03-23 17:25 EDT
tags: mongodb
---

The other day [Carlos E. Ramirez III](http://www.linkedin.com/in/carlosramireziii) and I were revisiting work in Mongoid when we happened on a couple of gotchas that took us longer to wrap our heads around than we would have preferred. Here they are:

READMORE

### Specifying Mongoid's 'default' option on another field causes weirdness with the `changes` method ###

We had something like this:

```ruby
class Offer
    include Mongoid::Document

    field :offer_id
    field :_id, default: -> :offer_id
end

```

To explain, basically we had some data coming in via an XML file that we were going to map to our Mongo model. We wanted to make use of the incoming XML IDs, and figured we could just swap out the Mongo generated ones with the ones in our XML file using the `default:` attribute.

It was all fine until I started noticing some strange behavior: While debugging our sync routine, I was checking Mongoid's `offer.changes`, which prints out a hash of attributes that have had their values changed since the object was last loaded from the DB. Along the way, it seemed that the output of this method would say the `offer._id` attribute (the value of which is equal to `offer.offer_id`, as specified by the `default:` option above) changed every time, regardless of whether it actually had or not.

There might have been a perfectly logical explanation for this, but one we could not find after a long search. Scared by this, and thinking we should probably not be messing with `_id` in this way, we decided to just maintain two different sets of IDs: our XML IDs and Mongoid's own generated IDs.

### Nested, embedded collection saving: doesn't seem to be a thing? ###

Take these snippets:

```ruby
class Offer
    include Mongoid::Document

    embeds_one :itinerary
    embeds_many :prices
end

class Itinerary
    include Mongoid:Document

    embeds_many :itinerary_days
end
```

Making a long story short here, we had an import that would add `itinerary_day`s to `offer.itinerary.itinerary_days` and then save the offer by doing `offer.save`. You'd expect any attributes we set on the `offer` to be saved (none shown here) as well as any `itinerary_day`s we added to `offer.itinerary.itinerary_days`, right?

Not a chance! `prices` saved as expected, but having our `itinerary_days` collection not embedded directly on the `offer`, but on a child of it (`itinerary`) makes it a different story. We chalked up our inability to get this to work, or find anything on it, to the nature of how embedded documents work. In our case, the solution was to explicitly `save` both the `itinerary` and the `offer` as such:

```ruby
offer.save
offer.itinerary.save
```

Are we just noobs? Drop us a comment below!
