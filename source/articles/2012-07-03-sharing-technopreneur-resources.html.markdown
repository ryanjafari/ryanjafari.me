---
title: 'Sharing "Technopreneur" Resources'
author: ryan
date: 2012-07-03 22:59 -05:00
tags: startups
---

A good number of you might consider yourselves technical entrepreneurs.

Even if you don't consider yourself an entrepreneur, I feel that it's important for all kinds of developers to know some things about what makes a product successful-- both from a technical and business perspective; whether that product be your own, that of a startup you're working for, or of a fortune 500 company.

Things here can range from very technical to very business-y. It's a giant smörgåsbord! They also don't have to be directly related to Rails, although some of them will naturally be since we're sworn Rails devs, right?

In any case, here are some of my bookmarked resources. I hope they are helpful!

READMORE

**What**: _Icon Fonts_
**Where**: [Using Icon Fonts](http://pictos.cc/articles/using-icon-fonts/) & [Icon Font Assets](http://css-tricks.com/flat-icons-icon-fonts/)
**Why**: Icon fonts are important because as devices become more hi-res (like all the Retina mumbo-jumbo out there today; by the way, the text on the new MBP looks glorious) your site might look like crap using normal raster/bitmap based images. Icon fonts are totally vector, totally scalable (just do "font-size:200%;"), and pretty awesome. I'm unsure of load times of an image sprite of icons vs. a font set of icons; I guess it depends on a bunch of variables but I'd almost argue that the font set would load faster. For these reasons, we try to keep all visual assets scalable with icon fonts. An easy way to use icon fonts is built into...

**What**: _Twitter Bootstrap_
**Where**: [Twitter Bootstrap's GitHub](http://twitter.github.com/bootstrap/)
**Why**: TBS is awesome because it takes the headache out of having to design UI elements from scratch in HTML/CSS over and over again, with the obvious drawback that your site will, of course, look more bootstrapped. TBS handles a lot of the UX and visual things for you, even some transitions and animations. It also comes with cool plugins that really handle a whole lot of typical front-end scenarios. I kind of like to think of it as Rails for HTML/CSS. TBS is great for technical entrepreneurs on a tight schedule and budget that just need to whip up a prototype right quick. There are even resources like [http://www.bootswatch.com/](http://www.bootswatch.com/) that enable you to customize the theme of your TBS-based app for you. We used to be in the anti-bootstrap camp, arguing that any good developer should write their own HTML/CSS from scratch. While every good developer should be able to do this, sometimes you just gotta get stuff done, and TBS is good for just that. Icon fonts from Font Awesome are built into TBS, and they are *really* easy to use. Rails people have significant reason to rejoice, since the twitter-bootstrap-rails gem [https://github.com/seyhunak/twitter-bootstrap-rails/](https://github.com/seyhunak/twitter-bootstrap-rails/) makes wiring up your Rails 3.1 asset pipeline app with Bootstrap a glorious experience deserving of lavish feasting and celebration. Oh and forgot to mention, TBS is designed responsively, so you can get smart, responsive layouts for your app basically for free.

**What**: _Foresight.js_
**Where**: [Foresight.js's GitHub](https://github.com/adamdbradley/foresight.js) & [Responsive Image Solutions](http://css-tricks.com/which-responsive-images-solution-should-you-use/)
**Why**: When you do need to go the regular ole' images route (say for a company logo or wordmark; icon fonts don't really apply there) you'll be wanting to serve hi-res versions of those assets to devices that can handle it. Foresight.js can tell if the client device is hi-res and if it's on a network with enough juice to download that hi-res image. Pretty cool stuff for developers and designers who like to keep up with cutting edge devices!

**What**: _Kopywriting Kourse_
**Where**: [AppSumo's Kopywriting Kourse](http://www.appsumo.com/copywriting-course/)
**Why**: Sometimes there's no way around it-- you just need to write copy. I'm not going to say we've all been there, but a good number of us have, especially freelancers and startup people. If you'd like a thoroughly entertaining set of copywriting lessons that will open your eyes to viewing the process of writing copy in an entirely different way, I highly recommend AppSumo's Kopywriting Kourse. It comes in the form of several videos filmed by a rather funny young gentleman and successful entrepreneur (I believe who runs AppSumo). Hate or love his unorthodox ideas, they just make sense! P.S. I have no affiliation with them whatsoever :)

**What**: _Email Marketing_
**Where**: [Automated Email and Customer Respect](http://blog.intercom.io/automated-emails-customer-respect/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+contrast%2Fblog+%28The+Intercom+Blog%29) & [Write Email That Gets Responses](http://feeds.gawker.com/~r/lifehacker/full/~3/l9TjQWhE1-Y/use-these-tips-to-write-email-that-actually-gets-responses)
**Why**: You need to get people to sign up for updates and/or beta invites to your brand spanking new app, but you're a mature technopreneur and realize the cold hard truth that no one gives a damn about your product (yet). User's attention spans are quickly dwindling with the overload of information being thrown into their inbox each day, amidst push notifications, social network updates, etc. It's a MESS. Make the most of that millisecond of the user's attention you do have by reading up on crafting smart emails.

**What**: _Cedexis CDN Analysis_
**Where**: [Cedexis CDN Country Reports](http://www.cedexis.com/country-reports/)
**Why**: There comes a time when your app is so popular you'll be needing a CDN for those static assets to better manage your load. Cedexis is a service that offers free reports on what the best CDN relative to your geographic location is. They also have some JS code you can add to your site so that they can report to you what the best CDN for your site in particular would be. Their main service I believe is a platform whereby you can have multiple CDNs working collaboratively, which they report is the most performant setup. We haven't tried any of their services out yet, but it all seems promising. While not the best according to Cedexis, I've heard good things about CloudFlare from fellow devs. Actually they offer some very cool features in addition to being a CDN, boasting enhanced web performance & security for your app. Check them out here. We haven't tried any of this stuff yet, but plan to with the launch of our startup. Again, I don't work for or associate myself with any of these companies. Once you have your CDN of choice, praise be to David Heinemeier Hansson and the Rails 3.1 asset pipeline, since setting it up with CDNs is a breeze. Heroku's got some great resources on that, a glorious hosting company for Rails apps you owe it to yourself to check out.

**What**: _Heroku_
**Where**: [Heroku Home](http://www.heroku.com/)
**Why**: We're developers and we probably want to focus on building apps that do cool things rather than bog ourselves down in server configuration. Heroku is a cloud hosting platform that abstracts the details of servers away from developers and into the cloud. Heroku has had some tough times in the past and recently, being affected by the Amazon datacenter outages and all (I guess half the internet was though), but the convenience of Heroku's deployment workflow (entirely integrated with Git) is worth it.

**What**: _BetaBait_
**Where**: [BetaBait Home](http://www.betabait.com/)
**Why**: There are several of these kinds of services I believe. We haven't tried really any of them, but are looking to do so in the near future. What do you guys and gals do for getting beta testers? Use one of these? Ask Mom and Dad? Hire some starving students on Craigslist?
