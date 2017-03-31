---
title: (Not) Installing Powder & Pow on Lion Server 10.7.3
date: 2012-03-03
tags: development
---

There comes a time in every developer's life where he or she is fed up with the way they handle account subdomains locally on their Ruby on Rails apps with `lvh.me`, and seeks a more real solution. For us, this solution came in the form of **Pow**, a Rack server for Mac OS X by the noble bros over at 37signals. Powder, a wrapper around Pow that makes it (even) easier to use, seemed additionally appealing. Alas, as luck would have it, I had no luck installing Pow on **Lion Server** 10.7.3. Why would I be running Lion Server in the first place, you ask? Well firstly, please don't ask, secondly if you must know you should know that I don't know myself how it came to be. I'd wager that I installed the wrong Lion from the App Store.

Anyway, Pow on Lion Server seems to be a bust from 8 months ago till now, from what I can gather on the following issue [thread](https://github.com/37signals/pow/issues/172). Perhaps I am overlooking something? In this post I'll go through what I've tried, experienced, and noticed during my trials with getting Pow to work on Lion Server:

READMORE

### Problems

- On `powder status`: `Error: Cannot get Pow status. Pow may be down. Try 'powder up' first.`
- On Pow install: `!!! Couldn't resolve configured domains (dev)`
- Console shows: `2/13/12 6:08:58.121 PM cx.pow.powd: tput: No value for $TERM and no -T specified`. This is probably benign.

### Interesting

Now, I am but a mere mortal. Nevertheless, I noticed the following: the firewall rule that is created looks like:

    65534 fwd 127.0.0.1,20559 tcp from any to me dst-port 80 in

Notice the port 20559. But when I do a `scutil --dns`, my resolver shows up as:

    resolver #8
      domain   : dev
      nameserver[0] : 127.0.0.1
      port     : 20560

Notice the port 20560. 20559 != 20560. Is this somehow related to the problem? I searched and searched, but am a n00b and have not found out how to edit that resolver entry. Any ideas anyone?

UPDATE: To edit the resolver entry, edit the file: `/etc/resolvers/dev`. Then, toggle your AirPort off and then back on to refresh the output of `scutil --dns`. As it turns out though, this doesn't fix anything.

### Pow (0.3.2) Installation Attempts

- Tried installing from source: `npm install`
- Tried installing from Homebrew: `brew install pow`
- Tried installing from powder: `powder install`
- Tried installing from the standard shell script: `curl get.pow.cx | sh`

### Resources for the Hopeless

- [Pow installation](https://github.com/37signals/pow/wiki/Installation)
- [Pow troubleshooting](https://github.com/37signals/pow/wiki/Troubleshooting)
- [Pow user's manual](http://pow.cx/manual.html)
- [Pow "Lion Server" issue](https://github.com/37signals/pow/issues/172)

UPDATE: Well, I never was able to fix it the clean and easy way, but following the instructions [here](https://github.com/37signals/pow/wiki/Running-Pow-with-Apache) got Powder & Pow working for me with minimal friction. Save for one thing: if requests you expect to be served by Pow are being served by Apache, make sure, as the article notes, that you don't have a duplicate virtual host for port 80. If you're getting the "Lion Server" default page, check the bottom of your `/etc/apache2/httpd.conf` file. You will notice a section like this:

    <IfDefine MACOSXSERVER>
        <IfDefine WEBSERVICE_ON>
            Include /etc/apache2/sites/*.conf
        </IfDefine>
        <IfDefine !WEBSERVICE_ON>
            Include /etc/apache2/sites/virtual_host_global.conf
            Include /etc/apache2/sites/*_.conf
            Include /etc/apache2/sites/*__shadow.conf
        </IfDefine>
    </IfDefine>

The lines that import `*.conf` and `*_.conf` are including a file `/etc/apache2/sites/0000_any_80_.conf` which has a virtual host entry for port 80. Make sure you deal with that. What I did was:

    <IfDefine MACOSXSERVER>
        <IfDefine WEBSERVICE_ON>
            Include /etc/apache2/sites/*.conf
        </IfDefine>
        <IfDefine !WEBSERVICE_ON>
            Include /etc/apache2/sites/virtual_host_global.conf
            #Include /etc/apache2/sites/*_.conf
            Include /etc/apache2/sites/*__shadow.conf
            Include /etc/apache2/sites/zzz_pow.conf
        </IfDefine>
    </IfDefine>

And included the config file from the above linked article to ensure that it loads (since it will no longer load as a result of removing the `*_.conf` line).

The `WEBSERVICE` lines refer to if you have Web Sharing enabled or disabled in System Preferences > Sharing. So make sure you edit the appropriate block.

After all that I have Powder and Pow working perfectly. Since you'll need Apache, you might want to make sure it is loading at startup if you don't want to have to remember to start it each time you are on a fresh boot. Lion Server defaults to starting up Apache at boot, so you might not have anything to do there. If you need to, the `org.apache.httpd.plist` file in `/System/Library/LaunchDaemons/` should be what you're looking for. Something like:

    sudo launchctl -w load /System/Library/LaunchDaemons/org.apache.httpd.plist

should do the trick I think. Cheers!

**UPDATE**: Upon installing Mac OS X 10.8 Mountain Lion, Apache's config seems to get wiped out. Before I tried replicating the above setup again, I did some research to see if I could get powder & pow running normally w/o the use of Apache as a reverse proxy. I checked back at the following pow issue [thread](https://github.com/37signals/pow/issues/172) and it had been updated quite extensively. Towards the bottom are recommendations for changes to firewall rules. I tried it out, making sure mine looked just as they do in those comments. I then disabled Apache from running by renaming the `org.apache.httpd.plist` to `org.apache.httpd.plist.bak`, restarted my computer, and glory, it was fixed! Finally the saga ends.. at least until next time..
