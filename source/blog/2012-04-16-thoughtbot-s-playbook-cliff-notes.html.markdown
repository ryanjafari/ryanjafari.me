---
title: "Thoughtbot's Playbook: Cliff Notes"
date: 2012-04-16
tags: startups
---

I always feel the need to take notes on whatever I'm reading. I feel like if I do so, I can better internalize and understand content by engaging my brain by both reading and writing.

That being said, last night I couldn't sleep, so I decided to use the early morning hours to go through [Thoughtbot's Playbook](http://playbook.thoughtbot.com/), a collection of notes on how to run a web business from a reputable Rails app development company I wish I was as cool as.

If you're the kind of person intimidated by long reads (I am, ever since I tried to read J.R.R. Tolkien's [The Silmarillion](http://en.wikipedia.org/wiki/The_Silmarillion) when I was yet a pre-teen, whereupon my eyeballs perished), then you might like my Cliff Notes of Thoughtbot's Playbook. Although, I'm told it's really not that long a read, but I may or may not still enjoy picture books. Anyway, here it is for your viewing (dis)pleasure..

<!-- more -->

### Your Users & Stuff

- Get people's input on what it is they need (product or service) that can help them with their problem. Keep in mind that people are good at explaining their problems, but bad at explaining what solution they need.
  - Run surveys ([Google Forms](http://www.google.com/google-d-s/forms/), [Wufoo](http://wufoo.com/))
  - If you're like Thoughtbot w/ their products, you might just be your own first customers! This is the case for us too, and I'd see it as an advantage.
- A low-cost, long term strategy for getting people to talk about your product is Inbound Marketing. Basically this amounts to creating content (blog posts, Tweets) relevant to people searching (Google) for solutions to their problems. This content then should introduce these people to your product. This is a pretty organic form of marketing that takes time and patience to develop (so start now).
- Don't make something no one wants: get outside your box and talk to people to make sure that doesn't happen.
- Learn without launching. This is something we've found value in that other people have beef with. Put something up and see if people like it.
- Make your marketing page really simple. No one likes to read or think, at all, on the internet. We've made the mistake of listing out bullets and bullets of features, but people don't need all that right away and don't want it, despite what they might tell you. Additionally, all those things might change, so try not to waste your time, at least early on.
- Tie yourself to a bigger trend: cloud computing, big data, etc.
- Be Unix-y: make your app do very few things very well.
- Hook people on the core functionality of your app first, then gradually educate them over time with periodic emails and the like. No one wants to sit through a tutorial the very first time they are interfacing with your product.
- Make feedback ridiculously painless for a user to give: "How's Dropbox?" => A) Awesome, B) Needs work. Done.
- AdWords users don't convert, but they refer people who do.
- A contact list importer can drive epic amounts of invites if it's well placed within your app.
- **A single person should be the caretaker of your app's vision. This person also prevents this vision from being pushed around by investors and your grandmother.**
- What are sustainable competitive advantages?
  - User experience (tired of hearing this already even though it's true)
  - Your app having unique data that a person can't get anywhere else
- Use [KISSmetrics](http://www.kissmetrics.com/) for A/B testing and figuring out user dropoff areas.
  - [A/B Testing with KISSmetrics & the split gem](http://robots.thoughtbot.com/post/9595887299/recipe-a-b-testing-with-kissmetrics-and-the-split-gem)
  - [Landing pages & maximum conversions](http://blog.kissmetrics.com/test-landing-pages-for-maximum-conversions/)
- Use Google Analytics for identifying traffic sources.

### Conversions Rules Of Thumb

- 10% of users will convert from your home page to a free trial
- 10% of users will convert from a free trial to a paid plan
- 1% of users will convert from a free forever plan to a paid plan
  - It seems like, then, you should start off charging (?)
- 30% of regular users will use the service
- 10% of regular users will use the service each day
- 10% of regular users that use the service each day is equal to the number of maximum concurrent users on your app
- 37signals: charge from day one
- Test adoption rates: # of paying users / # of total users
- Automatic emails are good (even though email is becoming a very tough area for engaging people because of the amount of email that bombards people daily; so make your emails really good, quick, to-the-point, and most of all, personal).
- A cool formula:
  - X = % of users who invite others
  - Y = average # of people they invited
  - Z = % of users who accepted the invite
  - X * Y * Z = awesome factor (I forgot what they called it)
- Optimize conversion and build referral mechanisms INTO the app (this is something your engineers do, not your marketing team).
  - Have these mechanisms come into play immediately after a user has a positive experience OR really wants to take an action that will only come after they refer people.

### Viral Growth

I * CR = K

- I = invitations
- CR = conversion rate of those invitations
- K = viral coefficient (ooohh!)
- Viral growth = K > 1 (it means you won)
- What's good for viral growth, then?
  - Single step invite flows
  - Encourage users to invite others when..
     - User is happiest
     - User wants to take another action
     - User uses an address book importer
     - User messages someone else in the app (?)

### Team Building

This is a very hard thing to do for a lot of startups. You see it all the time. Fortunately (or unfortunately) for us, we are the team, so really we have no excuse for failure :). I'm not going to go into much of what Thoughtbot said on this here, because it's not all that relevant for us, and while I'm writing this for you, you come second for now until I make you a product-- then I'll tell you that you come first.

Something that struck me though, in light of my last post. According to Thoughtbot: *"A designer is responsible for the total customer experience. They write HTML/CSS."* Maybe I don't know many designers, or many inhuman ones, but I've never met a designer (a Photoshop person) that codes HTML/CSS and codes it well. To me, HTML/CSS/JS is an art in itself and requires the energies of a separate person to maintain.

Seems like Thoughtbot charges their designers with a lot of responsibility, including UX too. It obviously works for them, but unfortunately hasn't worked for us in the past (perhaps because we generally employ contractors and such and don't have dedicated people constantly on hand). Maybe also our standards are a bit too strict, but I wouldn't expect someone who is a pro at Photoshop to be able to code modular and performant CSS on the level that we're accustomed to. I think they are two very different roles. Additionally, UX has been something that gets the shaft with those we work with, so we either need to find better people, do a better job of enforcing things, or make UX a separate thing/person. For now and for us, experience tells me that there's no way we can have a contracted/retainer-ed designer do all of these things because they either aren't full-time/people who care (enough)/or people who are versatile (enough).

### Technical Stuff

- [Heroku](http://www.heroku.com) and [Bluebox](http://www.bluebox.net/) for Rails apps
- Browser support
  - IE 7.0+
  - FF 3.0+
  - Chrome 3.0+
  - Safari 3.0+
- [Kumade](https://github.com/thoughtbot/kumade): Heroku deploy tasks with test coverage
- Continuous integration
  - [TravisCI](http://travis-ci.org/)
  - [tddium](https://www.tddium.com/): integrates smoothly with Heroku
- [New Relic](http://newrelic.com/): performance monitoring
- [Varnish](https://www.varnish-cache.org/): caching
- Amazon S3 ([CloudFront](http://aws.amazon.com/cloudfront/)?): content delivery network for serving static assets
- [Airbrake](http://airbrake.io/pages/home): error tracking
- [Rollout](https://github.com/jamesgolick/rollout): conditionally roll out features to select users

### Testing

- **Get testers for your app on Craigslist and pay them to come in, sit down, and use the product.**
- Use Silverback for studying testers while they interface with the app.
- Test your pricing by customer interviews, not A/B.
- Email users who fail to convert.
- Email users who are paying for AND using your product.
  - Give them the Sean Ellis test: "How would you feel if you could no longer use this tool?"
  - If 40% or greater say they would be "very disappointed", the app has a good chance to scale.

### Financial Stuff

- CAC (customer acquisition cost) = costs / customers
- Lower CAC (good) by:
  - Utilizing inbound marketing
- Raise CAC (bad) by:
  - Hiring a dedicated sales team
  - Paying for direct ads
  - Spending too much time on customer support
- Get a bookkeeper for profits & loss statements
- LTV = ARPU * (1 / churn)
  - LTV = lifetime value
  - ARPU = average revenue per user
  - churn = subscribers who leave during given time period
      - Indicative of dissatisfaction or competition
- Development costs:
  - Small-sized project: $50k - $100k (6 - 10 weeks)
  - Medium-sized project: $100k - $250k (4 - 6 months)
  - Large-sized project: $500k - $1m (12+ months)
- [Braintree](https://www.braintreepayments.com/) for payments
- On average, SaaS businesses spend 45% on sales and marketing relative to subscription revenue.

### Conclusion

Thanks for reading my notes-- hope they were helpful. In closing, I'd like to say something about why I think the internet is an inspirational medium through which to conduct business (aside from the obvious): I feel that on the internet it's harder to be the used car salesman. The internet is smart, users are smart, and they'll be able to call your bluff and realize when your offering is junk. I feel it's a good environment: working around and among people and businesses who just want to make good products. Call it idealistic, but the internet keeps everyone honest. If it's keeping the government at least a little bit more honest, you better be sure as hell you don't try shoveling anything under the rug. I'm in this business because I think it's possible to work hard to make a decent product to make a decent living-- I'm not talking about going viral and then dominating Facebook. More like, the same way Sal opens up his pizzeria and serves the freshest pies in the neighborhood, I think there's a way to do that on the internet. I believe there is a way. I know there is a way. Just gotta find it and figure it out.

--R
