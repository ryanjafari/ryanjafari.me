---
title: Too many authentication failures!
date: 2011-12-28
tags: development
---

There comes a time in every web app developer's life where he or she is merrily SSH'ing or git'ing along and hits the super annoying "Too many authentication failures" message. Basically this is a result of your SSH client going through your keys added via ssh-add and attempting to authenticate with the server with each of them. Problem is most servers have a limit on how many tries they will allow. If you have a ton of keys added to your keychain because you deal with many servers each day, you'll eventually hit this error because your client has tried too many keys with the server. One possible solution for this is to actually tell your SSH client what exact key file to send a particular host you are connecting to, so it doesn't need to try each one in your keychain. To go this route, try something like the following in your ~/.ssh/config file:

READMORE

    Host abc.com
      IdentityFile ~/.ssh/abc.identity
      IdentitiesOnly yes

    Host abc.defg.com
      IdentityFile ~/.ssh/abc.defg.identity
      IdentitiesOnly yes

It's becomes a little verbose with many entries winding up there eventually (think I have about 10) and the added fact that you need to be sure to add future SSH or git points, but it works!

