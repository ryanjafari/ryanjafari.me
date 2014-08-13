---
title: Why our code is better (and why it matters)
date: 2014-08-12 17:31 EDT
tags: css, ux-development, consulting
---

### Another story

Some time ago we were working alongside another team on a project (both the team and that project will remain nameless) when I started doing some audits of one of their front-end developer's code.

The HTML/CSS code was of the poorest I'd seen. It was impossible to look at, let alone work with to maintain or change it. Now, that was technically my opinion, but I wanted to make it more than just that, since opinions are a dime a dozen. I wanted to prove it was bad and at the same time make things right. So what did we do?

**We rewrote 98% of it.**

And we didn't bill a single dime for the work since we felt it was something that should have already been taken care of; our responsibility or not.

More importantly, what we *do* have as compensation is a sturdy product and a great little example of the quality of work we produce that nicely illustrates the difference between good and bad code.

Take a look:

<a href='css_comparison.png' data-toggle='lightbox' data-title='CSS Code Comparison'>
    <img src='css_comparison.png' width='100%' class='img-thumbnail' />
</a>

You'll notice two CSS files open side by side (CSS files handle the website's visuals, by the way). On the left, a CSS file with **66** lines of code, and on the right, a CSS file with **110** lines of code.

Both files do exactly the same thing, meaning, they show exactly the same thing on the web page when you load it up. You'll have to trust me on that one.

So, take a guess. Which file do you think contains better code? The one on the left or the one on the right?

### The answer and why it matters

You probably guessed it, but before I confirm the answer, let's understand one very important thing:

<blockquote>
  <p>Code is a liability, and the less code the better.</p>
  <footer>Ryan McGeery</footer>
</blockquote>

But why?

If your code is doing any sort of real work in the real world, like powering a business, then it will need to change, since businesses and their needs evolve over time.

So then, it is easier to change 66 lines or 110 lines of code? 

You got it. Less code on the left is better, not to mention *faster* too.

It's not enough for code to just merely fulfill its functional requirements in whatever way possible. This is because if that "whatever way" leads to bad (verbose, slower) code, it can make the fulfillment of functional requirements *down the road* more difficult when things need to change with your business, even if things seem to be fine now.

### Getting a little technical

So, why is one CSS file longer than the other? It's due to a few things that are wrong with it:

- **Global element selections**: When you code globally you increase the chance you'll need to create one-off hacks to get other areas of the site to look different.
- **Location-dependent styles**: When you code specific to a location (home page, about page) you cause a lot of code duplication.
- **Brittle/redundant use of selectors**: Don't add what code you don't need to and don't architect things in a way that if we move the location of the sign up form the entire site breaks and no one knows why.
- **Poor use of extended capabilities**: Sass, the subset of CSS these files are using, offers us tools to reduce the amount of code we write, so we better make damn sure we use them!
- **Keeping in images what should be in HTML/CSS**: If we have a banner that says "Happy Halloween" don't make that banner an image because then we have to get the designer to change it with Photoshop every time we want to change the holiday. Putting that text in the code makes changing it a snap.
- **Code duplication**: It's called Cascading Style Sheets (CSS) for a reason. Leverage classes and their ability to inherit from one another to foster code reuse.

I'm a big proponent of <a href='https://smacss.com/' target='_blank'>SMACSS</a> and <a href='http://www.smashingmagazine.com/2011/12/12/an-introduction-to-object-oriented-css-oocss/' target='_blank'>Object Oriented CSS</a>, both of which help decrease code duplication and increase code reuse. Not enough development teams take UX engineering of this kind seriously, but the situation is getting better with guides like these out there.

### Closing words straight from the competition

When I confronted the other team about their spaghetti code and my rewrite of it, I received this response from the director of their technology department:

> I took a look at your rewritten version. I must admit that it's pretty darn sweet. Frankly, I don't think any amount of code review would have resulted in the same conversion from right to left, but I'm thinking hard about how I can deliver that level of quality.

### Conclusion

*More code = harder to change code = more expensive to change code = bad code.*

The next time you need to tell who's code is better, a good rule of thumb is to see who can build the same functionality with less.

Think your code is bloated and unscalable? Need us to review your code?

<a href='http://ryanandcarlos.com/#contact' class='btn btn-primary' target='_blank'>Contact us</a>
