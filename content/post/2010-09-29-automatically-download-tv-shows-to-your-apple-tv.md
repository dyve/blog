+++
date = "2010-09-29T11:22:00+00:00"
draft = true
tags = ["JustMigrate", "apple tv", "bittorrent", "tv series"]
title = "Automatically download TV shows to your Apple TV"
+++
<p>This is a tutorial to set up automatic downloading of TV shows to your Apple TV. I've been postponing this post for a while because I think the solution is not quite polished enough (I doubt you actually need Google Reader). However, it seems better to share this so others can improve upon this. If you do, please leave a message in the comments of this post directing others to the improved version. You're welcome to contact me through <a href="http://twitter.com/dyve">Twitter</a> or e-mail (see sidebar).</p>
<p><strong>Requirements</strong></p>
<ol>
<li>You have a hacked Apple TV (meaning you have SSH access)</li>
<li>You have a BitTorrent client installed on this Apple TV. If you don't, I suggest you <a href="http://dyve.posterous.com/transmission-2-on-apple-tv-3">install Transmission</a>.</li>
<li>This BitTorrent client watches ~/Torrents for new torrents.</li>
<li>You have the binaries for wget and sed installed (probably using <a href="http://code.google.com/p/atvusb-creator/">Patchstick</a>)</li>
<li>You know how to move files to your Apple TV and edit them (before and/or after).</li>
</ol>
<p><strong>Step 1: Subscribing to shows</strong></p>
<ol>
<li>Create an account at <a href="http://showrss.karmorra.info/">ShowRSS</a> and subscribe to a few shows.</li>
<li>Make sure you have a <a href="http://www.google.com/reader/">Google Reader account</a>.</li>
<li>Subscribe to your ShowRSS feed in Google Reader.</li>
<li>Put the feed you just subscribed to in a folder (name it "torrents").</li>
<li>Make this folder public (Google Reader &gt; Settings &gt; Folders and Tags)</li>
<li>View the folder in Google Reader, click Show details, and copy the Feed URL that is shown. It will ook like this: `<a href="http://www.google.com/reader/shared/user...`">http://www.google.com/reader/shared/user...`</a></li>
</ol>
<p>That's it. Paste the url into a text editor or e-mail it to yourself for reference. You will need it in the next step.</p>
<p><strong>Step 2: Getting torrent files to the Apple TV</strong></p>
<p>To get the torrents to your Apple TV, we will use this script. Copy and paste it to /Users/frontrow<span style="">/gettorrents.sh</span>, and replace MY_FEED_URL with the url you got from the previous step.</p>
<p>&nbsp;</p>
<div class="CodeRay">
  <div class="code"><pre>#!/bin/bash -x
HOME=/Users/frontrow
TORRENTS=/Users/frontrow/Torrents
WGET=/usr/bin/wget
FEED=MY_FEED_URL
cd $HOME
touch $HOME/torrents.log
$WGET -nd -q -O - $FEED | egrep -o &quot;enclosure\&quot;[ \t]*href=\&quot;[^\&quot;]*\&quot;&quot; | sed 's/.*\(http:.*\)\&quot;.*/\1/' &gt; $HOME/torrents.temp1
grep -f $HOME/torrents.log -x -v torrents.temp1 &gt; $HOME/torrents.temp2
rm $HOME/torrents.temp1
$WGET -N -P$HOME/.gettorrents -i $HOME/torrents.temp2 --restrict-file-names=unix
if [ 'ls $HOME/.gettorrents/*' ]; then
        cd $HOME/.gettorrents
        for e in *; do mv &quot;$e&quot; &quot;`echo $e | sed -e 's/\ /_/g'`.torrent&quot;; done
        mv *.torrent $TORRENTS
fi
cat $HOME/torrents.temp2 &gt;&gt; $HOME/torrents.log
rm $HOME/torrents.temp2</pre></div>
</div>

<p>Then execute these commands:</p>
<div class="CodeRay">
  <div class="code"><pre>mkdir ~/.gettorrents
chmod 755 ~/gettorrents.sh
~/gettorrents.sh</pre></div>
</div>

<p>If you did everything right, you should see a lot of output from the last file, and your torrents should be fetched form Google Reader. If not, you should backtrace to find what you did wrong.</p>
<p><strong>Step 3: Start script every hour</strong></p>
<p>Save the script below as /Users/frontrow/Library/LaunchAgents/net.dyve.gettorrents.plist</p>
<div class="CodeRay">
  <div class="code"><pre>&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;
&lt;!DOCTYPE plist PUBLIC &quot;-//Apple Computer//DTD PLIST 1.0//EN&quot; &quot;http://www.apple.com/DTDs/PropertyList-1.0.dtd&quot;&gt;
&lt;plist version=&quot;1.0&quot;&gt;
        &lt;dict&gt;
                &lt;key&gt;Label&lt;/key&gt;
                &lt;string&gt;net.dyve.gettorrents&lt;/string&gt;
                &lt;key&gt;ProgramArguments&lt;/key&gt;
                &lt;array&gt;
                        &lt;string&gt;/Users/frontrow/gettorrents.sh&lt;/string&gt;
                &lt;/array&gt;
                &lt;key&gt;StartInterval&lt;/key&gt;
                &lt;integer&gt;3600&lt;/integer&gt;
                &lt;key&gt;StandardOutPath&lt;/key&gt;
                &lt;string&gt;/Users/frontrow/gettorrents.log&lt;/string&gt;
                &lt;key&gt;StandardErrorPath&lt;/key&gt;
                &lt;string&gt;/Users/frontrow/gettorrents.log&lt;/string&gt;
                &lt;key&gt;ServiceDescription&lt;/key&gt;
                &lt;string&gt;scheduled download of torrents&lt;/string&gt;
        &lt;/dict&gt;
&lt;/plist&gt;</pre></div>
</div>

<p>Check it by manually loading the script:</p>
<div class="CodeRay">
  <div class="code"><pre>launchctl load /Users/frontrow/Library/LaunchAgents/net.dyve.gettorrents.plist</pre></div>
</div>

<p>Done! Every TV show you subscribe to in ShowRSS will be downloaded to your Apple TV when the torrent is available!</p>