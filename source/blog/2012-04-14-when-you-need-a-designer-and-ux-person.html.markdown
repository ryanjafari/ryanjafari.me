---
title: When You Need A Designer And UX Person
date: 2012-04-14 22:16 -05:00
tags: design
---

Over the years we've toyed with many different design & development workflows.. You know, the so-called stages of development: prototyping, storyboarding, design, development, testing, whatever! There are many similar, but different variations out there. I'm sure you've checked out your share of trendy design firm's "Process" pages. But that's not to say every design & development workflow should be the same for every team out there-- it definitely shouldn't. Some crews are going to have more of a focus on what their speciality is. For instance, [Zurb](http://www.zurb.com/) is heavy on interaction, while [Worry Free Labs](http://www.worryfreelabs.com/) is pretty design-y, and [Thoughtbot](http://thoughtbot.com/) rocks code hard. Having substantial familiarity with these shops will show you this, but it's also pretty easy to tell from their site's overall message. Sorry, I'm the master of tangents-- this isn't an article about marketing.

Despite these differences, there's one thing that we think should remain constant: the realization that, in the end, everyone would probably do well to have everything (more or less) happen at around the same time, collaboratively and super iteratively. Yeah I've heard of the Agile thing, thanks (and I'm sure this is exactly where this is all going, but hear me out).

READMORE

### A Design & Development Debacle

Of course, this is as hard as it sounds. Having all the resources you need at any given moment is a luxury not everyone has-- especially not us, as a small development team of two. But you simply cannot serialize the stages of design & development. And here's **roughly** why:

- Design => Development
  - Your designer is awesome at making things look great, but they aren't always UX experts, or pros on how things can or should work from a code or functional perspective.
  - Design lock-in: you've spent a bazillion dollars on these juicy looking designs and it's tempting for you and your front-end dudes to realize these designs in "pixel-perfect" fashion. \[By the way, there are actually tools for overlaying images or PSDs on your screen to make your HTML/CSS implementations pixel perfect, but from my experience this is a mistake conceptually and time-wise.\] Don't bother, 'cause that stuff is going to change fast, and change it should, as feedback and iterations roll in. Tremendous time-sink that I've been guilty of in the past.
- Development => Design
  - You've built the app out. It looks like complete balls, but hey it works. You show it to your designer and say: "Make this look good." Nice, 'cause if you're unlucky, you might have a problem here:
    - Your designer doesn't want to make you angry, and basically sacrifices creativity and "innovation" (whatever that means anymore) for keeping your app intact-- more or less skinning that stuff you slapped on the page during development. Now it's like crap wrapped in shiny gift paper. OR:
    - They just completely disregard anything you've shown them regarding how the app works (or if you wanted to avoid the above bullet, you actually haven't shown them anything-- thought you were clever there, huh?) and come up with something that is just so far away from ever actually working within the context of the app, for whatever reason.

That all might sound like I blame these misfortunes on the designer. I absolutely do not, since I love designers far more than I love myself. I blame you, the guy in charge, naturally.

So what did we learn? Yes you guessed it, it's a mess. How about this then: let's favor a development & design "conversation" over a serialized "process" that occurs in "phases" or "stages" \[that's so the old way, and even if it's more resource friendly, it's just not going to work out well\]. Remember, this is not a factory fine-tuned with robots to produce a million clones of the same product we know from head-to-toe. We're humans trying to figure out something that is very much a mystery, and like it or not we've got to work together, side-by-side, at every moment (give or take a couple moments we need for ourselves in private).

### Rise Of The UX Person

You've got a developer and a designer-- it's the minimum, and you can definitely make it work if you enforce legitimate collaboration. But if you're sitting nice and cushy in your firm's loft in SoHo, then you've probably got people like UX developers/designers/experts/rockstars/showstoppers, as well as a storage area of a thousand or so baboons working on your next big idea. Back to the UX people though. While I once thought these people were entirely unnecessary, I found myself to be only partially correct. They actually do fit in nicely between developers and designers, informing both on things like UX "best practices" if they've done their research from reasonable resources like Microsoft's and Apple's UX guidelines (here's a great [roundup](http://usabilitygeek.com/official-usability-user-experience-user-interface-guidelines-from-companies/) of the official UX documentation of various companies), UX whitepapers, and metrics they've gathered from A/B testing on previous projects. In addition they might be members of design and UX forums like [Forrst](http://forrst.com/) or [UX Exchange](http://ux.stackexchange.com/?tab=month). UX people can help bridge the gap between development and design and answer some of the questions no one really has a clue on, and cut out some of the vast, overarching assumptions made about users and their needs during design and development with data to back them up (but remember those needs usually can't be generalized between apps and your UX person should know that and a bit about your target audience).

So when do you need a designer? Always pretty much. But what if you don't have one. First answer: get one on retainer. But what if you really don't? Second answer: outsource. And finally:

### You Don't Have A Designer

You're screwed! Kidding. If you don't have a designer or lost yours (as in our case), you'll be tempted to come up with re-designs and designs for new sections of your app on your own, piecing together existing visual elements like Legos. This is cool, and even good to a certain extent. If your designer equipped you with a nice set of Legos, you can be very versatile with basic changes, rearranging things, etc. Ideally you'll work with (or be) a UX person too, and this will help mitigate your chances of your new designs looking like they were pulled from where the sun doesn't shine. But, there will be a time, and you'll know when it is, when the jig is up! I've been thinking of a rule for how to definitively tell when the need for a designer rolls back into town, but I can't exactly.. So I'll try to convey my sentiment through an anecdote.

Right now the app I'm working on needs:

- 404, 500 pages
- A revisiting of our reporting & graphs section of the site (soon)

For marketing-esque type pages like 404 or 500 pages (where you of course want cute things like GitHub's [Octocat](http://octodex.github.com/)) you'll ideally want a designer \[By the way I pray nightly that one day I have the budget to do cool, senseless crap like this\].

For entirely new sections that are heavy on unique types of visualizations (like graphs) that may not use visual elements from the standard set of Legos your designer has given you, don't fake it and try to put colors together-- You REALLY should have a designer come up with something creative for you.

So in my opinion you need a designer for:

- UI element designs (panels, custom controls, buttons, and all the other cool-looking stuff)
- Marketing-esque pages and promotional materials
- New app sections that you don't feel confident constructing from your set of visual Legos (those panels, buttons, widgets, etc.)

Of course this is an ideal world where we have unlimited budgets and are making the perfect app. By all means, strive for perfection! Don't fake it until it is the absolute last resort in humanity.

### Twitter Bootstrap

You can go far in development with BS, without a designer. But then you're building a Bootstrap site. If that's okay with you, great, you've just cut out a sizable resource expense. If you plan to transition from BS to "real" designs once you've got the app fully implemented... we might then land ourselves in the same Development => Design boat mentioned above. But, if you're being super agile about your development & design process you might be OK. I probably wouldn't opt to show the app to the designer though, I'd probably just explain it to them and see what they come back with and iterate on that (since I'm clever and don't want to stifle creativity with a scaffolded app). Inside joke for people who read this article. Listen I know there's half the world's population blogging about tech and design stuff right now and I'm not special, but everyone has to feel a little special to get through the day right?

### Sweet Zurb Stuff

Some random bull here. We like Zurb and their [Foundation](http://foundation.zurb.com/) framework. I've also stumbled upon their epic suite of potentially excellent (haven't tried them yet, though intend to) interaction and design proofing tools: <http://www.zurb.com/apps>

### Takeaway

Basically the situation where you blindly have a designer mockup the entire application without ever taking serious time to think it through and reconcile it on your side is a mistake (your mistake). You should say OK, thanks for this one mockup, STOP and WAIT while we work with it, let us mull it over for a while (weeks). See how it works with your needs in the context of ongoing development. Then move onto the next area. Collaborative and iterative (Agile) on not only development, but design & development simultaneously. We've all made this mistake many times before, so let's not be too hard on ourselves here: learning is one of the best parts of this whole line of work (kicking myself when I'm down after a mistake is also one of my favorite parts as you can tell).

Thanks for reading my notes. If you are so inclined, flame on in the comments and send hate mail to me and my family. We promise to never involve the authorities.

Cheers!
