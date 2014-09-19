---
title: 'Showdown: Foundation vs. Bootstrap'
date: 2014-09-17 16:00 EDT
tags: bootstrap, foundation
---

It's no secret that Zurb's Foundation has been living in the shadow of Twitter's Bootstrap for a while now. I'm a big Bootstrap guy since 1.0 as you might know (even merging the two loves of my life in this [work](/ff7-bootstrap)).

Over the years I've been closely monitoring both Foundation's and Bootstrap's progress, and now I'm ready to come out and say why it might be time for you to seriously consider trying out Foundation for your next project. Once the ugly red-headed stepchild, now sexier.

### Oh boy, naming conventions

Hear me out on this one; this stuff matters: it matters for your future carpal tunnel how many characters you have to type and it matters if you appreciate  concise, readable markup. Ever since Bootstrap 3, Bootstrap's naming conventions have just run completely amuck. Let's start with an easy, albeit minor example, one you're all too familiar with:

#### Buttons

```html
<!-- Bootstrap button -->
<a href="#" class="btn btn-default btn-lg">Click me!</a>

<!-- Foundation button -->
<a href="#" class="button large">Click me!</a>
```

What is there left to say here? Both do the same thing, but how much nicer is Foundation? Bootstrap seems to have gone the route of using as few characters as possible, I'm sure influenced by Twitter's own bandwidth needs (trying to transmit as few characters across the pipes as possible). I can appreciate that, but at least in this case, because of how they've architected the style options, it ends up being the same amount or more characters anyway. Sexy. Let's move on.

#### The Grid

*...a digital frontier. I tried to picture clusters of information as they moved through the computer.*

If you're reading this you'll probably get the reference (I couldn't resist).

Let's compare naming conventions and responsive options of grids between the two front-end frameworks. Check it out:

```html
<!-- Bootstrap grid -->
<div class="row">
  <div class="col-sm-2 col-lg-4">...</div>
  <div class="col-sm-4 col-lg-4">...</div>
  <div class="col-sm-6 col-lg-4">...</div>
</div>

<!-- Foundation grid -->
<div class="row">
  <div class="small-2 large-4 columns">...</div>
  <div class="small-4 large-4 columns">...</div>
  <div class="small-6 large-4 columns">...</div>
</div>
```

Bootstrap is more concise here, character wise, but can we talk about readability? I just can't get completely used to their clunky feeling ```xs sm md lg``` names. Foundation is even forgiving if you want to use ```column``` or ```columns``` here.

Honestly I'm happy to call it a day, but I'm going to go above and beyond to show you why you need to start considering Foundation more. Bootstrap may be running off the fumes of its brand name, but Zurb is doing *work* to make coders happier. What can I say? They're good. Even despite how annoying their boastful monthly newsletters were.

### The "block grid"

This puppy needs its own section.

Often times I just want a grid where I can put in as many elements as I want, and it will automatically organize them into rows with equal-width columns. Especially in the context of working with data-driven web apps, it's a pain in the ass to write server-side helpers that generate the correct markup, organizing elements into the right number of rows depending on how many of them there are and the column width specification (as you must when you use Bootstrap). Let's call this a block grid, as Foundation calls it. You gotta check this out:

```html
<!-- Implementing a "block grid" in Bootstrap -->
<div class="row">
    <div class="col-sm-3"><img src="hello.jpg" /></div>
    <div class="col-sm-3"><img src="hello.jpg" /></div>
    <div class="col-sm-3"><img src="hello.jpg" /></div>
    <div class="col-sm-3"><img src="hello.jpg" /></div>
</div>
<div class="row">
    <div class="col-sm-3"><img src="hello.jpg" /></div>
    <div class="col-sm-3"><img src="hello.jpg" /></div>
    <div class="col-sm-3"><img src="hello.jpg" /></div>
    <div class="col-sm-3"><img src="hello.jpg" /></div>
</div>

<!-- Implementing a "block grid" in Foundation -->
<ul class="small-block-grid-3">
  <li><img src="hello.jpg" /></li>
  <li><img src="hello.jpg" /></li>
  <li><img src="hello.jpg" /></li>
  <li><img src="hello.jpg" /></li>
  <li><img src="hello.jpg" /></li>
  <li><img src="hello.jpg" /></li>
  <li><img src="hello.jpg" /></li>
  <li><img src="hello.jpg" /></li>
</ul>
```

GUYS. This is big. Now in your server-side logic you can just loop through your collection without having to worry about making rows and setting the column size with every element.

### Foundation features that Bootstrap can't (won't) answer

...and perhaps for good reason. Perhaps yes, they want to keep Bootstrap lean, and leave features like the below to plug-in developers. I get that. Problem is the Bootstrap plug-in community is a little cruddy sometimes (don't worry, still love and appreciate you guys). But when every front-end developer under the sun is building Bootstrap plug-ins, you're bound to get some lemons. Oh front-end developers, you've got a pretty rough reputation to fight through when it comes writing quality code.

Foundation might go the way of Bootstrap when it comes to plug-ins as it gains even more traction than it already has, but for now it has taken those crappy plug-ins I yearn for a great implementation of and done them a solid, making them first-class features in its own framework. The Zurb team seem to have been able to incorporate more advanced components here that build off of the core of the framework all without (seemingly) adding much bloat.

Now, let's go through some of these things, things we've all been asking Bootstrap for that Foundation delivers:

#### Interchange

Of course there are JS libraries that handle this for you, but it's nice to have this baked into your primary HTML/CSS front-end framework. Interchange handles responsive content: keeping bandwidth intensive media like big images and interactive displays (Google Maps) for larger screens. It's probably safe to assume that smaller devices will have less speed/bandwidth than larger devices for now, although hopefully that line will be blurred one day when this country decides to start taking its data infrastructure a little more seriously. In Hong Kong, I'll serve whatever the hell content I damn well please to your mobile device.

#### Off-canvas

<img src='uber_nav.png' class='img-thumbnail img-left pull-right' width='25%' />

If there's one thing I learned over my 4+ years consulting, it's that clients love off-canvas menus. Ok maybe I learned a lot more important things than that, but I used to */facepalm* every time a client would mention it. You know how many times I've heard: "hey, do you know that slide out thing on Uber?" Listen, we can spend a month making you a custom off-canvas menu solution, find some wonky jQuery plug-in to work with, or we can just give you a standard "on-canvas" navigation menu.

Now, all of those options make clients sad, but rejoice! While Bootstrap doesn't come with this, Foundation does, and I'm sure in no small part due to how many times it was requested by Zurb's clients. Everyone is happy.

#### Icon bar

Yup, it's no secret. Everyone loves a good icon bar.

#### Built-in lightbox!

Glory! Bootstrap lightbox plug-ins are crappy. But Foundation's built-in lightbox solution is not. Sometimes you just need a solid lightbox, as overdone as they are. Zurb's fits the bill.

#### Range Sliders, Abide Validation

Honestly I'm salivating at this point. Foundation kicks ass. I don't need a third-party range slider plug-in anymore (even though I highly recommend http://refreshless.com/nouislider/) and validations are built-in on top of HTML5 validations. So when HTML5 validations have become ubiquitous, you can just pop out the plug-in and you're ready to roll.

#### Joyride

Ever need to implement some sort of quick user tour on your app's dashboard? Hell yes you have. You can go with some flaky Bootstrap tour plug-in, or you can rock the house with Zurb's own Joyride.

#### Pricing tables

Minus one for this guys. Now we might be getting a little out of hand. Do we really need this? Seems like something you can easily put together from more basic components. I'm with the Bootstrap boys on this one.

#### Equalizer

This comes up less frequently these days than it used to, but once upon a time I became obsessed with equally sizing components/columns vertically. It's not the easiest/cleanest thing to do solely in CSS, so Foundation leverages a bit of JS to handle it. And listen, to those CSS purists: sometimes you guys go a little too far in insisting that *everything* be implemented in CSS. JavaScript is a thing for a reason, and a tool for a purpose. If it's easier to do it in JS, just use it. Reminds me of those "table-less" tables back when people were just beginning to go nuts with CSS. Gee, let's make tables out of only divs. Ok cool, why? You'd never get a good answer to that when you asked.

Bootswatch!

### Where Bootstrap wins: Bootswatch

Foundation themes are basically non-existent. If you need a quick re-theming of your standard out-of-the-box Foundation components, you'll have to do it yourself. Not that big of a problem, but certainly not as convenient as Thomas Park's Bootswatch for Bootstrap (by the way, the new logo kicks ass dude).

Bootswatch is the cats meow and I'll tell you why:

**Problem:** The whole world's worth of web apps now all look the same because they use Bootstrap.

- *Proposed Solution 1:* Customize the shit out of Bootstrap to your specific use-case and put it up on http://wrapbootstrap.com/, then sell it.
- *Proposed Solution 2:* Add a tasteful skinning of colors and typography on top of standard Bootstrap components and have it all under one quality-controlled repository at http://bootswatch.com/, for free.

My philosophy is this: frameworks like Foundation and Bootstrap exist because generally there are only a finite amount of UI elements and paradigms you'll need to implement for your run-of-the-mill web app. These frameworks handle most front-end needs, and they allow you to customize the crap out of them should you need to for whatever reason (although ask yourself: do you *really* need to do that? Perhaps a discussion for another day).

When you customize the hell out of Bootstrap, it's basically not even Bootstrap anymore. You've added tons of CSS, changed class names, and deviated from standard Bootstrap HTML structures. The number of people that your code is now useful for has shrunk to basically you and your teammates. And that's great. But please don't package it up and sell it so that some poor sap can spend $10 on it for the eye candy and then wrestle with it more than it helps before they end up throwing it out.

### Conclusion

In general Foundation really feels like it takes the weak parts of Bootstrap and improves on them, and then adds some much needed parts as well. Parts that perhaps we don't always need, but damn do they come in handy. I know what the Bootstrap team is saying now. Is Foundation bloated? Is it doing too many wild and funky things that require JS? Is it too heavy? Maybe, but what I do know is it really comes in handy in places where Bootstrap doesn't.

If you just need to "get stuff done" and make your life easier, give Foundation a try for your next project. Let me know how it goes in the comments below.


