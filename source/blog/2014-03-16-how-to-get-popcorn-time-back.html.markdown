---
title: How To Get Popcorn Time Back
date: 2014-03-16 20:01 EDT
tags: movies
---

*This post is for informational and educational purposes only. I do not endorse or condone stealing in any way, which Popcorn Time doesn't do directly, but facilitates.*

Seems like Popcorn Time is here to stay at [time4popcorn.com](http://www.time4popcorn.eu/).

<s>**Update**: [YIFY](http://yify-torrents.com.come.in/), the website that Popcorn Time is based on, took over Popcorn Time and provides fully built apps on GitHub [here](https://github.com/Yify/popcorn-app/releases/tag/v0.2.7-beta), which weren't available to my knowledge at the time of this writing. I'm not sure on the legality of this, so if they ever take that down, you're back to this guide to help build it yourself :)</s>

---

### What's Popcorn Time? ###

Popcorn Time was/is a an app for streaming tons of movies for free. Because it is built with web technologies, it was/is available for any operating system.

### Why Do You Say "was"? ###

Obviously something like this wasn't going to go long without getting serious press, and therefore because of the nature of what the app does, serious legal pressure too. Even though the authors claim the app was technically legal, when you go after people's livelihood (and especially the livelihood of very well resourced movie companies), their lawyers are going to find a way to stop you.

The authors of Popcorn Time apparently had enough taking the heat, and decided to shut the service down the other day. This made a lot of people sad.

### Goodbye Popcorn Time... Sort Of ###

<img src='bye_popcorn_time.png' width='35%' class='pull-right img-left' />

Popcorn Time is open source software, so on announcement of its shutting down, an Internet's worth of software developers rushed to get app back up and running. And they were successful. Since right now it's a bit technical to get Popcorn Time up and running again, I decided to make a high-level overview guide for the very adventurous every-user to build it from the source code that's publicly available. Here goes:

*This guide is for informational and educational purposes only. I do not endorse or condone stealing in any way, which Popcorn Time doesn't do directly, but facilitates. You download, build, and use Popcorn Time from its source code entirely at your own risk.*

### Get Popcorn Time Back - The Guide ###

#### Prepare Your Computer ####

- **Install Xcode** *(Mac Only)*: Xcode is Apple's developer suite. When you install Xcode, it also installs things that node and npm will need to install. You can get Xcode from the Mac App Store, [here](https://itunes.apple.com/us/app/xcode/id497799835?mt=12). Just follow along with the installer and you should be fine. Ensure that "Command Line Tools" are installed if you are presented the option of installing them.
- **Install Cygwin** *(Windows Only)*: Cygwin isn't officially supported anymore for what we need to do, but you can move forward at your own risk [here](https://github.com/joyent/node/wiki/Building-node.js-on-Cygwin-%28Windows%29). Just type those commands in Cygwin, pressing enter after each line.
- **Do nothing** *(Linux Only)*: My favorite kind of step. Linux should already be set up as you need it to be, so nothing left to do here!

> Everyone can check whether they are ready to go or not by typing this in either their Terminal or Cygwin: `which gcc`. If it spits back something to the effect of `/usr/bin/gcc` you should be golden.

#### Install Some Weird Stuff ####

2. **Install node and npm**: Node and npm are pieces of software that need to be in place for you to be able to build Popcorn Time from source. Here's how it's done:
    1. Create a new, blank text file on your Desktop using TextEdit.app (Mac) (`/Applications/TextEdit.app`) or Notepad.exe (Windows). Copy and paste the following code in it:
    
        ```
        echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc
        . ~/.bashrc
        mkdir ~/local
        mkdir ~/node-latest-install
        cd ~/node-latest-install
        curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
        ./configure --prefix=~/local
        make install
        curl https://www.npmjs.org/install.sh | sh
        ```
    Save it as `node-and-npm-install.sh`. It's important you have the `.sh` in there.

    2. Open Terminal (Mac) or Cygwin (Windows) on your computer. Terminal.app is located in the "Utilities" folder of the "Applications" folder on your Mac (`/Applications/Utilities/Terminal.app`). For Windows people, there should be a shortcut for Cygwin somewhere in your Start menu. When you see a scary black or white box pop up, you did it right.
    3. In Terminal (Mac), type `chmod +x ~/Desktop/node-and-npm-install.sh`. In Cygwin (Windows) type the same thing, substituting `~/Desktop/` with the directory where you put the `node-and-npm-install.sh` file on your computer. Press enter. Running this command is going to allow you to execute the script contained in the file we just made.
    4. In Terminal (Mac), type `cd ~/Desktop` press enter then type `./node-and-npm-install.sh` and press enter again. In Cygwin (Windows) type the same things, substituting `~/Desktop` with where you put the `node-and-npm-install.sh` file on your computer.
    5. The installation process should now be running. A whole load of text should be scrolling across the Terminal or Cygwin window.

2. **Install Popcorn Time**:
    1. Install Grunt: While still in your Terminal or Cygwin, type: `npm install -g grunt-cli` and press enter. Let it do its thing.
    2. At this point you'll *probably* need Ruby. If you're on Mac or Linux you should be cool. If you're on Cygwin, install Ruby [here](http://rubyinstaller.org/) then come back here when you're done.
    3. Download the code for Popcorn Time, [here](https://github.com/Yify/popcorn-app/archive/master.zip). If that link doesn't work anymore for whatever reason, find the "Download ZIP" button on this [page](https://github.com/Yify/popcorn-app) and click it to download the code. Put the downloaded file, `popcorn-app-master.zip`, on your Desktop.
    4. Double-click that file. It will expand its contents on your Desktop. Your terminal should still be pointed towards your Desktop (e.g. `~/Desktop`). Now type `cd popcorn-app-master` to go into the freshly expanded folder. You're almost there!
    5. Run each of these commands, pressing enter after each line:
    
        ```shell
        npm install
        grunt build
        ```

    6. When all that stuff is done, it should have made a `build/releases/Popcorn-Time/mac` folder in the `popcorn-app-master` folder. Look inside of it, and there should be a Popcorn Time application waiting for you. It looks like a nice, tasty box of popcorn. Double-click it and now you should have Popcorn Time!

Thanks and I hope you choose to learn from this guide responsibly!
