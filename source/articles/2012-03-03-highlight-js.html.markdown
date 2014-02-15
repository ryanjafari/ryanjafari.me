---
title: highlight.js
author: ryan
date: 2012-03-03 21:04 -05:00
tags: development
---

Just came across an amazing JS/CSS based syntax highlighting tool for web pages that I've been able to __very__ easily integrate with our Tumblr account. It's called [highlight.js](http://softwaremaniacs.org/soft/highlight/en/). Thinking of using Prettify, SyntaxHighlighter, or any other syntax highlighting solution with your Tumblr (or other) blog? Think again. Highlight.js is a godsend especially if you like to use Markdown for your blog posts (as we do). Just write your usual Markdown post with your typical [Markdown code block](http://daringfireball.net/projects/markdown/syntax#precode). Highlight.js will automatically detect the code block and the language in which it is written (and syntax highlight it appropriately). Haven't tried it with any other form of post editing, but I'm sure it works just as well with anything else (rich text editor, plain text/HTML, etc.)-- definitely worth a shot. And it's got themes (woot)! Here's a quick rundown of how I got it working:

READMORE

1. Download [here](http://softwaremaniacs.org/soft/highlight/en/download/).
2. Upload your theme of choice (CSS file) from the `styles` folder to your server (for Tumblr users, use the [static upload tool](http://www.tumblr.com/themes/upload_static_file) to get a Tumblr hosted URL to your uploaded CSS file). I chose the `styles/github.css` theme.
3. Upload the minified `highlight.pack.js` file to your server (for Tumblr users, again, use the static upload tool linked above to get a Tumblr hosted URL to your uploaded JS file).
4. Place the following code in the `<head>` section of your HTML. Tumblr users can edit their theme (via the 'Customize theme' function in your blog's dashboard) to do this:

```html
<link rel="stylesheet" href="[LOCATION OF CSS]">
<script src="[LOCATION OF JS]"></script>
<script>hljs.initHighlightingOnLoad();</script>
```

Save and refresh (Tumblr make take a minute to update as it did for me). Your post's code blocks should automagically be syntax highlighted with the correct language. No special classes or other nonsense that needs to be added when you create your post!
