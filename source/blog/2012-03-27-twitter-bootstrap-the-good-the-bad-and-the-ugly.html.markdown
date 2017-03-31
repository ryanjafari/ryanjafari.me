---
title: 'Twitter Bootstrap: the good, the bad, and the ugly'
date: 2012-03-27
tags: bootstrap
---

CSS prototyping frameworks are convenient tools that can give your app cool "out-of-the-box" (and consistent) visual elements and styling (and in some cases interactivity too).

[Twitter Bootstrap](http://twitter.github.com/bootstrap/), one of these CSS prototyping frameworks, is all the rage now, as you probably know. It's heavily marketed by Twitter to developers, trendy, cool, and hip. I was first introduced to it while looking for a quick way to get some styling for a prototype. Among its "competitors" are [Zurb Foundation](http://foundation.zurb.com/) (which by the way we ended up using for that prototype). Why? Well Twitter Bootstrap seemed to be a little too invasive into our HTML-- meaning that often our HTML had to have a certain structure to accommodate Bootstrap. We thought Foundation was a little bit cleaner (and less bloated) on the code end of things. But ANYWAY...

READMORE

Being an HTML/CSS developer, the kind who likes to actually understand what every bit of HTML and CSS is actually doing, I initially cringed at murmurs in the community of using something like Bootstrap or Foundation for a production app. I truly believed the only place for these tools, **ever**, would be for use in rapid prototyping of a web app. Off we went then, prototyping and merrily using Foundation. End of story right? No, wrong.

Then, one day, the internet was taken by storm by developers having nerdgasms over Twitter Bootstrap, and how awesome it made their app. Everywhere you turned: GitHub, Twitter, Forrst, StackOverflow... developers were singing praises of Twitter Bootstrap, and how it revolutionized their entire careers. "Oh", I said. "That's cool, so you guys are doing some awesome prototypes, right?". Nope, wrong again. People were Bootstrapping live production apps with bazillions of people. I was disturbed-- in fact, I nearly had a stroke. What's the big deal, Ryan? Well I'll tell you a few (big) reasons why I thought doing such a thing was punishable only by racking:

- **Performance**: I don't really know what kinds of things Bootstrap is doing CSS-side, and I'm not sure that I care to find out. Selector performance? CSS-bloat and redundancy? I've not run any tests, but I'll put my money on it that this isn't one of Bootstrap's (or any other CSS prototyping framework's) strengths (nor should it be). True optimization in this regard comes per-app, and takes time. Maybe you don't care about performance-- that's cool, but it is still one drawback.
- **The "Bootstrap Web"**: Wouldn't it be great to have a web where everything looked like Twitter Bootstrap? Not! Or so I thought at the time..
- **It's built on LESS**: we prefer SASS here at Cetrasoft (not because it's just what we know, but because we actually prefer it).
- **General QQ'ing**: I was upset that people would rather just never learn a thing about HTML/CSS/JS and use some monolithic front-end framework to do everything for them, not bothering to take the time to learn something new by building out their own framework. I've since changed mind a bit..

Then, I read this article from Baregit, a new Git repository hosting service: <s>To Bootstrap or Not?</s>. Well, it pretty much changed (almost) everything about how I looked at Twitter Bootstrap (and others) for production use. Here's why (basically a summary from the article):

- **Easy visual consistency** between your applications and other Bootstrap applications around the web, making users comfortable with tried and true visual and interactive paradigms. In the article, the writer makes an analogy between Bootstrap and Gnome/WPF/Cocoa. The buttons, dialogs, etc. of applications under each of those frameworks look the same from application to application. I initially thought this was a bad thing, but it actually is a good thing.
- **Tested with many browsers**. Big win here.
- **Visual and interactive choices that make sense**-- so you don't have to worry about choosing. Huge win for me personally. Choosing puts a lot of stress on.
- **Speed of development**. I used to think that re-engineering the wheel each time was cool. It's definitely not cool when you need to get stuff done, focus on making great apps, and ultimately run a business.

So in conclusion, I stopped hating on Bootstrap and its fundamentalist users so much. Will we use a CSS prototyping framework for our next production app? I'm not sure if I'm sold to that extent, but let's just say we'll definitely be considering it for the above mentioned reasons. Cheers!
