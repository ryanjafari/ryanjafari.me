---
title: "git flow: The current HEAD is no feature branch"
author: ryan
date: 2012-03-05 22:55 -05:00
tags: development
---

Say what??

So you think you're a baller Rails dev, writing 1337 codez and making nubs QQ. You're using git flow and your buddy tells you to check out his new branch he just pushed, because while the back-end is great, it looks mediocre and you need to make it look hot (I'm the front-end guy).

READMORE

Remember, since you are using git flow, you go about your business and try and check out his code:

```bash
$ git flow feature pull <name>
The current HEAD is no feature branch.
Please specify a <name> argument.
```

WTF right? Yeah I know that's what we said. Since we are cool about Googling and such, we found out that you need to use the following syntax `git flow feature pull origin <name>`, (the keyword being 'origin') like so:

```bash
$ git flow feature pull origin <name>
Created local branch feature/<name> based on origin's feature/<name>.
```

A `git branch -a` will show you the added local branch just pulled, which you should be now on.

```bash
$ git branch -a
    develop
  * feature/<name>
    master
    remotes/heroku/master
    remotes/origin/develop
    remotes/origin/feature/<name>
    remotes/origin/master
```

Hope that helps. Cheers!
