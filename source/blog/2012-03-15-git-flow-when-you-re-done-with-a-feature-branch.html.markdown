---
title: "git flow: when you're done with a feature branch"
date: 2012-03-15 20:05 -05:00
tags: development
---

UPDATE: It's probably also a good idea to rebase your feature branch against your current develop branch before you finish it. This way, you can ease a bit of the pain of merge conflicts since when you finish your feature you will have already rebased against the branch that the finish merges to (develop).

Next up in the git flow chronicles, and more of a note for myself than anything: today I was done with my work on a feature branch I had taken over from my buddy Carlos. I had staged everything and committed, all looking good. However when I finished the feature branch using `git flow feature finish <feature_name>` I got a 'not fully merged' warning for my feature branch. The 'git flow feature finish' went through, but the local feature branch wasn't deleted like it usually is. I figured I screwed something up. Working through everything with C-man, I got to what I think is a fairly decent process for what to do when finishing up work on a feature branch and preparing to merge it to develop (local) and push it to develop (remote):

READMORE

```bash
# assuming you're on the feature branch...
# do the usual stuff to make sure all your changes
# are committed to the local feature branch
git add -A
git commit -m '<message>'

# make sure you've got all the latest stuff
# also, make sure you do git flow feature pull and not
# regular git pull because this is how things
# can get messy down the road with merge conflicts
# because you didn't use git flow functions properly
git flow feature pull origin <feature_name>

# make sure you have the latest develop
git checkout develop
git pull origin develop

# NEW: go back to the feature branch
# and rebase it against the current develop
# NOTE: it is not advisable to do this rebase
# if you are working on the remote of the feature
# branch with someone else, in that case instead
# just push to the remote feature branch and finish
# the feature, having it merged into develop normally.
# the rebasing here is just to help w/ conflicts when you finish it
# but if what is on the remote feature branch is important to
# you or someone else don't do this since rebasing here will screw
# up its git timeline
git checkout feature/<feature_name>
git flow feature rebase <feature_name>

# so if you are just working on this
# feature alone, you'll want to force the
# push, since you just rebased against develop
# and the remote won't have any clue what's going on
# giving you a ton of conflicts. in fact, you can
# probably just delete the remote here and finish it,
# merging it into develop-- git flow shouldn't annoy
# you about the stuff not being in the remote since
# the remote would be gone
git push origin feature/<feature_name> -f

# finish the feature branch
git flow feature finish <feature_name>

# do your branch cleanups
git push origin :feature/<feature_name>
git remote prune origin

# you're on develop now hopefully, so
# just be sure you got the latest on develop
# 'cause you're going to push some stuff
git pull origin develop

# after you are all square and have fixed any
# conflicts, added, and committed...
git push origin develop
```

Cheers all! Happy git flow-ing!
