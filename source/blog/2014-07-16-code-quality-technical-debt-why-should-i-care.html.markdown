---
title: Code quality & technical debt... why should I care?
date: 2014-07-16 18:34 EDT
tags: consulting
---

Is code quality important? Does it really matter? What harm can "bad code" do?

It's been a real struggle for my consultancy to demonstrate the importance of code quality and technical debt to our clients. I take a tremendous amount of pride in our work and consider our code to be the best of the best, especially against some of the horrors we've come across in our day. Still, it seems nearly impossible to convey this to someone who doesn't have a background in technology.

Whether you've reached my article because you're a technologist struggling with this same problem, or you are non-technical person wondering why you should care, I hope I can enlighten and inform you on the differences between code quality and technical debt, and why they are important to your clients and business.

### Code quality ###

<img src='wtfs.png' width='40%' class='pull-right img-rounded img-left' />

Software quality can refer to:

1. How well application code carries out its design
    - Does the code do what we want it to do?
        + Example: This one's easy. If I code a button to, when clicked, open up a pop-up, does it do it? Does it work quickly? Does it work time after time without slow downs or visual anomalies?
2. The value of the product it produces
    - Does the product stack up to the competition?
        + Example: So we've built this product. It's a website that rates restaurants. Is it easy to navigate? Is the content relevant and well-organized?
3. How well it meets the non-functional requirements (robustness, maintainability) that support the functional requirements
    - Does the code have errors under different stressors like increased traffic or random user inputs? Is sensitive information shielded from prying eyes? Can an outside programmer understand the code from a glance?
        + Example: We have a form on our website. Does it return from errors gracefully when a user puts an email address in a price field? When the website is busy, do people have a hard time submitting the form due to slowness? Are passwords and credit card details sent from our customers to our servers securely? If we look for more help to fix these problems, can a new programmer get in the code and resolve issues quickly?

As you can see, well-written code is important for a bunch of reasons. Poorly written code however, can negatively impact another facet of codebase integrity called technical debt.

### Technical debt ###

Basically, every time we build a new feature we need to do a lot of work to support that feature properly. Work here can be defined as any code written to support something new.

It's kind of like that game Jenga, you know, the one with the blocks that you stack.

<img src='jenga.jpg' width='25%' class='pull-right img-rounded img-left' />

So away you go with your friends taking turns stacking one block at a time. What happens after a while? Well the point of the game is that the structure starts to become unstable, and whoever is the first player to make it fall loses.

Features in software are a lot like those blocks. We keep adding features because they're cool and fun, but there is a very real cost with each one we add. It makes things larger, more complex, and more unstable. Just like our Jenga tower. With each one, we are more and more indebted to the towering behemoth we've been creating.

And then there are deadlines, because this is real life. Let's throw that into the mix. Imagine: now you're playing Jenga with a timer. You don't have that much time to carefully position your blocks. You see where this is going right? Not only do you now have more features, but you have more less thought-through features because of the time constraint.

Ok I understand, but what *exactly* is this debt? Wikipedia puts it pretty nicely:

>"The debt can be thought of as work that needs to be done before a particular job can be considered complete. If the debt is not repaid, then it will keep on accumulating interest, making it hard to implement changes later on. Unaddressed technical debt increases software entropy."

The debt is coding work you need to get done to keep things tidy and well-architected: separating code into modules, removing duplicate/unused/temporary code, etc.

#### When the tower falls ####

So what happens when the Jenga tower falls? What's the analog to my software business? Great questions, and this is where it gets potentially worse than Jenga. In Jenga, when it all comes down, everyone knows it and has a big laugh. It's obvious and it's noisy and embarrassing for who loses. But a software collapse isn't always as apparent. Sure, your website could go down, but you'd probably be lucky if it was something that noticeable...

Sometimes it can take years before the impact of putting in that last block is felt. Technical debt can be a silent killer that can cost you massive bucks when you need to re-write software, or worse, when you lose customers because you have difficulty implementing new functionality to address their demands. You can even (and yes we've seen this happen) have trouble finding someone to pay to work on your code, because good developers can smell a stinking codebase from a mile away.

Tech. debt is a tricky beast because more features mean more money, right? It may seem that way, but companies like Apple and 37signals have shown us that sometimes less can be more. Less is easier to manage. Less costs less and keeps profits high. If you can sell less, you should.


### An example horror story ###

We had a client once who came to us with a Ruby on Rails application built by a PHP programmer. Because of this, they didn't have the requisite savvy to leverage the power of the Rails framework to their advantage. What does this mean? It means that the programmer was writing things from scratch that Rails already provided; he just didn't know any better.

When you go on like this for a while, not making use of pre-existing software that already does exactly what you need, you cripple code robustness and maintainability and find yourself in serious debt.

At a certain point the client wanted to introduce new functionality into their app that we advised was essentially impossible given the state of the codebase. There was only one place to go from there, and it was rewrite land.

Just one small example of how not managing a technology product well from the get go can cost you tens of thousands of dollars, potential customers, and a good night's rest for a while!

### What you should do ###

Quality, unencumbered code is a long-term investment. You may not see great things happen right away, but it's an absence of bad things down the road that you can look forward to.

As consultants, it's our job to educate our clients on these matters and ensure we're doing right by them in these regards, even if it doesn't seem like they much care. It's the right thing to do, and too often I see careless work done by those who should know better.

As clients, you should always have a person or team you trust overseeing development, whether or not they're the actual ones working on the project.

If you're struggling with an app you feel is burdened by poor code quality and technical debt, check out our [Website Watchdog](http://ryanandcarlos.com/watchdog) package that can sniff out your app's silent killers.

<a href='http://ryanandcarlos.com/watchdog' class='btn btn-primary' target='new'>Learn more about Website Watchdog</a>


