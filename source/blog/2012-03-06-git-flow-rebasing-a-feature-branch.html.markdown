---
title: "git flow: rebasing a feature branch"
date: 2012-03-06 18:57 -05:00
tags: git
---

And so the saga continues. Today my good coding ninja/monkey/rockstar/overlord/&lt;enter other catchy recruiter name-calling here&gt; friend Carlos told me that I could get an old git flow feature branch up to speed with our main develop branch by rebasing it against the current develop branch.

I'll pull the front-end guy card out again and say "well, hell, what do I know?!"

It goes something like this `git flow feature rebase <feature-branch-name>` (now in that name, you need not include 'feature/'). Do this while you are on the feature branch itself (it may or may not matter, but that's what I did being a front-end git nub).

And... after a crap ton of conflict fixing, the old feature branch that needed to be dusted off is up-to-speed and good-as-new! That's your quick byte for today. Cheers!

Oh and P.S. we love our clients, no really we do. But this was a funny/demoralizing link one of them sent to us after a lightning fast turnaround we had on a bug: [flipping monkeys](http://www.youtube.com/watch?v=jEuBpa0zXrc).

Well guys, we may be coding monkeys with great turnaround (or flips), but when you put enough of us in a room with typewriters for long enough, we're going to write Shakespeare! And hey, haven't we been to the moon too? Or something...
