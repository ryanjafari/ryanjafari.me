---
title: How to include system, public, and/or third party C libraries in RubyMotion
author: ryan
date: 2014-01-30 13:23 -05:00
tags: rubymotion-osx, something, something-else
list: development
---

_This is part one in a series of posts about my trials and tribulations in OS X development with RubyMotion._

Well the mere mortal that I am, this was a bit tricky to figure out, coming from being a RubyMotion and OS X development newcomer. My only hope is that the pain and struggle was not in vain, if you, my fellow newb, can learn from it. **Onward!**

### Including PulseAudio ###

Don't ask why, but I needed to include PulseAudio's C libraries into my RubyMotion app so that I could call methods that would interact with a PulseAudio daemon running on my computer. By the way, PulseAudio is a popular desktop audio server that's used in various distributions of Linux (and with the help of Homebrew, now on my Mac). Clients that use it can interact with the computer's sound hardware to do a whole bunch of crazy things.

### app.libs ###

One of the options RubyMotion's App.setup object provides us is the `libs` option. According to the [RubyMotion Project Management][1] documentation, `libs` refers to...

> Library paths to link against, as an Array. It should contain paths to public, system libraries, for example `/usr/lib/libz.dylib`. The default value is [], an empty array.

Like you, this time, I was flying by the seat of my pants. Well, that's most times I'll admit. So I figured to try including the main PulseAudio dynamic library in my installation's `lib` directory. Turns out it looks like this:

```ruby
Motion::Project::App.setup do |app|
    app.libs << '/usr/local/Cellar/pulseaudio/4.0/lib/libpulse.dylib'
end
```

I went ahead and `rake` compiled and ran my app. No complaints. I then tried both in the terminal and in code to find a constant that I knew the library defined, like `PA_CONTEXT_UNCONNECTED`. Not a chance that it was going to work like this alone. I needed to find some way that my app could speak to this foreign library. A language both could understand.

### bridgesupport ###

I went ahead and did some research and found out the RubyMotion's `Motion::Project::Config` class supports an option called `bridgesupport_files`. So then you ask, WTF is bridgesupport? [bridgesupport][2] is a tool Apple ships with OS X that generates XML files that describe the APIs of frameworks/libraries that a scripting language like Ruby cannot otherwise see at runtime. PRETTY SWEET. It takes header files from these libraries and converts them into XML files describing their objects, fields, methods, etc. `gen_bridge_metadata` is the executable that exists on an OS X system that is able to generate these files. Go ahead `which gen_bridge_metadata` if you don't believe me. Ok bridgesupport; good to know. But what do we do now?

### motion.h ###

There's a really smart guy named [Dave Lee][3] who put together a simple and useful gem called [motion.h][4] for facilitating the use of bridgesupport in RubyMotion, integrating it into the build process that happens when you run your project's `Rakefile` by typing `rake`. It takes header files from the library you want to use as input. Here, I'll show you:

```
# Gemfile
gem 'motion.h'

# Rakefile
Dir['/usr/local/include/pulse/**/*.h'].each do |f|
  app.include File.basename(f), prefix: File.dirname(f)
end
```

Note that `File.basename(f)` is something like `pulseaudio.h` and `File.dirname(f)` is like `/usr/local/include/pulse/`.

**GOTCHYA:** One thing to remember is that I don't believe either motion.h or bridgesupport will read into and include header files included by header files. So you'll have to `app.include` each one explicitly like I've done above. On some libraries I've tried (`glib`) this doesn't work well since they complain about not requiring certain headers directly. In that case, I didn't go any farther with trying to get it to work.

**GOTCHYA:** Another note is that motion.h automatically prepends the Mac OS X developer system library folder to the `prefix` option you see there. That may or may not be OK with you. I found it annoying since my library was at `/usr/local/include`, but I'm assuming my case was an outlier. In order to get around it, and for the above to work, I did a quick and dirty hack:

```
# Rakefile
class MotionHeader
  def include_path
    @prefix
  end
end
```

Gasp, my mother would be appalled.

And that's it! Next up, Gems & RubyMotion.


  [1]: http://www.rubymotion.com/developer-center/guides/project-management/#_os_x_options
  [2]: https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man5/BridgeSupport.5.html
  [3]: https://github.com/kastiglione
  [4]: https://github.com/kastiglione/motion.h
