---
title: Polymer, Web Components, Angular/Ember... WTF
date: 2014-07-23 16:14 EDT
tags: web-components
---

<img src='polymer_angular_ember.png' width='40%' class='pull-right img-rounded img-left' style='margin-bottom:15px;'/>

So like I was, you're confused about Polymer, Web Components, Angular/Ember and the whole deal. How they relate to one another, what is a replacement for what, what's gaining traction, what's just hype, etc.

It started when a client reached out to me yesterday and recommended I take a look at the <a href='http://www.polymer-project.org/' target='_blank'>Polymer project</a>. He said it built upon Web Components, which I had read the spec for in the past, but it was a little fuzzy in my memory and I needed some brushing up. I've been a long time Bootstrap + Rails guy, always toying with whatever the latest JS framework gaining traction is. I've typically tried to stay in the sweet spot of fairly ubiqutous and stable frameworks, only seldom venturing into the true unknown/experimental stuff.

However, it was a good damn thing he spurned me into doing my homework on this, because clearly Web Components are the future of front-end web application development. Google, Mozilla, and even Microsoft seem to think so also, committing to making serious R&D efforts to implement the <a href='http://www.w3.org/TR/components-intro/' target='_blank'>W3C</a> spec into their browsers.

### Polymer, a ways off? ###

That said, to my understanding, native implementations of Web Components in major browsers are still a ways off. However, the Polymer project helps facilitate the use of Web Components today in select browsers. In theory, as time passes, we'll be using less and less of Polymer, and more and more of native Web Components.

For now, Polymer is still in developer preview and changing as the Web Component spec changes, so the consensus is that it isn't all that stable, and many warn against relying on it heavily for production apps. One major drawback is that Polymer won't work in all major browsers in use today, so if your application isn't one where you can control the browser version used (like most public sites on the net), your app won't work at all, or might crap out on any given update (as I've heard have happened to Polymer apps with recent Google Chrome upgrades; remember, these happen automatically for a lot of users).

### Confusion between frameworks ###

Something that I needed to clear up for myself as I did my research on this is understanding the differences between a front-end JavaScript MVC framework like Angular/Ember vs. Polymer. Let me go into that a bit.

Angular/Ember are complete MVC frameworks and provide a whole lot of high level APIs for handling routing and such. They also provide for their own implementation of components which have similar goals to Web Components. I've been thinking of them as "fake" components, but that's not to disparage them since they are usable and stable now and today, whereas Polymer is a little less so. The Angular/Ember teams have said that they are taking "true" Web Components very seriously, and are having their own implementations of components (the "fake" ones) increasingly mimic the w3c spec as closely as possible, so that when "true" Web Components are out and about, Angular's/Ember's transition to them will be seamless.

Polymer, despite some confusion, is not a replacement for Angular/Ember (in its current form anyway). They are separate projects with separate goals (for now). My understanding is that Polymer at the moment can be looked at, for the most part, as a view layer experiment that you can bolt onto your existing Angular/Ember app. Much in the same way <a href='http://facebook.github.io/react/index.html' target='_blank'>React.js</a> says it can be used on their website:

> Lots of people use React as the V in MVC. Since React makes no assumptions about the rest of your technology stack, it's easy to try it out on a small feature in an existing project.

So the good thing about Polymer is that you seem to be able to pop it right into any existing Angular or Ember app, and solely use it for the view layer in your MVC stack. The core Polymer library does contain the facility for creating components for a lot of the stuff that Angular/Ember does, but it seems to require a bit more work to get that stuff going (and it's again a little more unstable).

That's my understanding of all this at this moment in time. Angular/Ember are still here to stay for now, especially as they work towards Web Components. I'll keep my Polymer usage experimental unless I have more control over what browsers my users are on.

Want to talk tech? Great! You should get in touch with me. But before you do:

<a href='http://ryanandcarlos.com/' class='btn btn-primary' target='_blank'>Learn more about my consultancy</a>
