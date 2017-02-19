+++
date = "2010-10-05T10:10:00+00:00"
draft = true
tags = ["JustMigrate", "apple tv", "ffmpeg", "handbrake", "homebrew", "video", "videomonkey"]
title = "Faster video conversion with VideoMonkey"
+++
<p>Today I discovered that the discontinued application <a href="http://www.techspansion.com/">VideoHub</a> has an open source successor named <a href="http://videomonkey.org/">VideoMonkey</a>. My first experiments with this conversion tool were encouraging. VideoMonkey uses the well-known <a href="http://ffmpeg.org/">ffmpeg</a> for transcoding video. On the <a href="https://sourceforge.net/projects/videomonkey/forums/forum/884113/topic/3295067">VideoMonkey forum</a>, users noted that the speed of VideoMonkey could be improved by:</p>

<ol>
<li>Tweaking commands.xml</li>
<li>Using a newer version of ffmpeg</li>
</ol>


<p>I decided to take a look. First of all, the tweaking of commands.xml seems unnecessary since VideoMonkey has a setting for the number of cores to use. Therefore I skipped this part.</p>

<p>Upgrading ffmpeg seemed like a good idea. especially since the ffmpeg that comes with VideMonkey reports that it is not compiled to use multithreading.</p>

<p>First I used <a href="http://github.com/mxcl/homebrew">homebrew</a> to compile install the latest and greatest version of ffmpeg, optimized for Snow Leopard. If you don&rsquo;t have homebrew installed, install it before trying this.</p>

<div class="CodeRay">
  <div class="code"><pre>brew update
brew install ffmpeg</pre></div>
</div>


<p>Then I copied the newly compiled ffmpeg to the VideoMonkey app</p>

<div class="CodeRay">
  <div class="code"><pre>cp /usr/local/bin/ffmpeg /Applications/VideoMonkey.app/Contents/Resources/bin</pre></div>
</div>


<p>Now we have a minor problem. The presets from VideoMonkey are not accessible to the new binary. I fixed this by copying those to a supported settings directory in my home dir.</p>

<div class="CodeRay">
  <div class="code"><pre>mkdir ~/.ffmpeg
cp /Applications/VideoMonkey.app/Contents/Resources/ffpresets/* ~/.ffmpeg</pre></div>
</div>


<p>Done.</p>

<p>With these changes, I&rsquo;m currently converting .mkv files to .mp4 about 50% faster than Handbrake does. Of course, your mileage may vary, but I&rsquo;d be happy to read your experiences in the comments.</p>