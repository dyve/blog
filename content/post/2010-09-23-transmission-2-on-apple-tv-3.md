+++
date = "2010-09-23T04:45:00+00:00"
draft = true
tags = ["JustMigrate", "apple tv", "bittorrent"]
title = "Transmission 2 on Apple TV 3"
+++
<p>Somehow my Apple TV developed some issues and had to be reinstalled from scratch. Not a problem, except that I couldn't get <a href="http://dyve.posterous.com/a-proper-rtorrent-install-for-apple-tv">rtorrent to run properly</a> on Apple TV 3 again. Since <a href="http://code.google.com/p/rtorrent-appletv/">rtorrent for Apple TV</a> development basically seems to have stopped, I decided to look around for a different solution rather than dive into rtorrent. I found a bittorrent client I had previously tried on Apple TV, the well known application named Transmission. The newer versions come with a built in web UI, and a smart guy named <a href="http://lfroen.livejournal.com/">lfroen</a> is distributing <a href="http://lfroen.livejournal.com/5446.html">binaries for Apple TV</a>. Pretty cool!<br /> However, I had some problems getting Transmission 2 to work. Eventually I think I figured it out. Here's what I did, I hope it helps some of you.</p>
<blockquote class="posterous_medium_quote">
<p>This article assumes you have SSH access to your Apple TV, are comfortable with doing some command line stuff on your Apple TV. If you break or brick your Apple TV while doing this, don't blame me. I cannot guarantee this will work, however, it's working for me. Still here? Let's get to work!</p>
</blockquote>
<p><strong>Step 1: Prepare</strong></p>
<p>You will need:</p>
<ol>
<li>An SSH-accessible Apple TV</li>
<li>The&nbsp;<a href="http://lfroen.livejournal.com/5446.html">Transmission 2 binaries for Apple TV</a></li>
</ol>
<p><strong>Step 2: Extract</strong></p>
<p>Extract the files from the archive you downloaded. This will give you 2 files and a directory.</p>
<p><code>transmission-daemon (file)<br />transmission-remote (file)<br />web (directory)</code></p>
<p>Move these to your Apple TV (I'm assuming you'll put them in /Users/frontrow).</p>
<p><strong>Step 3: Install</strong></p>
<p>Make sure the permissions of the files are OK, and create the proper directory for the web folder. You can do this by executing these commands (if asked for a password, it is frontrow).</p>
<p><code>sudo chmod 755 transmission-*<br /> sudo chown frontrow:frontrow transmission-*<br />mkdir /Users/frontrow/Contents<br />mkdir /Users/frontrow/Contents/Resources<br />mv web /Users/frontrow/Contents/Resources/<br />sudo chmod -R 775 /Users/frontrow/Contents/Resources/web</code></p>
<p>We also create 2 more directories because we'll need them later. If you already have these somehow, feel free to skip this:</p>
<p><code>mkdir /Users/frontrow/Downloads<br />mkdir /Users/frontrow/Torrents</code></p>
<p><strong>Step 4: Test</strong></p>
<p>Execute this command:</p>
<p><code>/Users/frontrow/transmission-daemon -f</code></p>
<p>You should see a message similar to this</p>
<p><code>Transmission 2.XX (YYYY) started<br /> Port Forwarding: ...</code></p>
<p>If you don't, you did something wrong. Start again!</p>
<p>Quit Transmission with Ctrl-C.</p>
<p><strong>Step 5: Adjust settings</strong></p>
<p>When Transmission started, it created a default settings file. We'll need to adjust that file. The file is located at:</p>
<blockquote class="posterous_short_quote">
<p>/Users/frontrow/Library/Application Support/transmission-daemon/settings.json&nbsp;</p>
</blockquote>
<p>You can find the various settings in Transmission's documentation. I recommand you edit the file, and change these settings (you may need to add some settings if they are not yet present in your settings.json). Leave all other settings intact!</p>
<p><code>"download-dir": "/Users/frontrow/Movies",<br />"incomplete-dir": "/Users/frontrow/Downloads",<br />"incomplete-dir-enabled": true,<br />"open-file-limit": 32,<br />"peer-limit-global": 120,<br />"peer-limit-per-torrent": 30,<br />"rpc-whitelist": "192.168.*.*",<br />"rpc-whitelist-enabled": true,<br />"speed-limit-down": 100,<br />"speed-limit-down-enabled": true,<br />"speed-limit-up": 10,<br />"speed-limit-up-enabled": true,<br />"trash-original-torrent-files": True,<br />"watch-dir": "/Users/frontrow/Torrents",<br />"watch-dir-enabled": true</code></p>
<p>You can set the speed limits to what you prefer yourself of course. Also, Set rpc-whitelist to a mask that suits your home network, or read the <a href="http://trac.transmissionbt.com/wiki/EditConfigFiles">Transmission documentation</a> if you want a more complex setup.</p>
<p>Note that we keep incomplete files in the Downloads folder, store complete files in the Movies folder, and watch the Torrents folder for new torrents.</p>
<p>You can test the new settings by running the test from step 4 again. If your settings are wrong, Transmission will tell you.</p>
<p>If you have succesfully set the rpc-whitelist mask, you will be able to see the web interface by visiting <a href="http://appletv.local:9091">http://appletv.local:9091</a></p>
<p><strong>Step 6: Load automatically</strong></p>
<p>Now we will make sure that your perfectly working Transmission will start whenever the Apple TV boots. Again, we need to make sure a directory exists:</p>
<p><code>mkdir /Users/frontrow/Library/LaunchAgents</code></p>
<p>And in this directory we create a LaunchAgent file:</p>
<p><code>nano -w /Users/frontrow/Library/LaunchAgents/transmission.plist</code></p>
<p>The text editor nano will open, and wait for your input. Copy and paste this:</p>
<p><code>&lt;!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN"  "http://www.apple.com/DTDs/PropertyList-1.0.dtd"&gt;<br />&lt;plist version="1.0"&gt;<br /> &lt;dict&gt;<br /> &lt;key&gt;GroupName&lt;/key&gt;<br /> &lt;string&gt;frontrow&lt;/string&gt;<br /> &lt;key&gt;Label&lt;/key&gt;<br /> &lt;string&gt;org.m0k.transmission&lt;/string&gt;<br /> &lt;key&gt;ProgramArguments&lt;/key&gt;<br /> &lt;array&gt;<br /> &lt;string&gt;/Users/frontrow/transmission-daemon&lt;/string&gt;<br /> &lt;/array&gt;<br /> &lt;key&gt;RunAtLoad&lt;/key&gt;<br /> &lt;true/&gt;<br /> &lt;key&gt;ServiceDescription&lt;/key&gt;<br /> &lt;string&gt;transmission-daemon&lt;/string&gt;<br /> &lt;key&gt;UserName&lt;/key&gt;<br /> &lt;string&gt;frontrow&lt;/string&gt;<br /> &lt;/dict&gt;<br /> &lt;/plist&gt;</code></p>
<p>Save, exit and you are done! If you reboot your Apple TV (sudo reboot), you should find Transmission up and running after the reboot.</p>
<p><strong>Resources used</strong></p>
<ul>
<li><a href="http://wiki.awkwardtv.org/wiki/Transmission_on_AppleTV">http://wiki.awkwardtv.org/wiki/Transmission_on_AppleTV</a></li>
<li><a href="http://mrcolinsappletvguide.tumblr.com/post/387192506/transmission-bittorrent-client">http://mrcolinsappletvguide.tumblr.com/post/387192506/transmission-bittorrent...</a></li>
<li><a href="http://mrcolinsappletvguide.tumblr.com/post/409688283/starting-transmission-automatically-on-boot">http://mrcolinsappletvguide.tumblr.com/post/409688283/starting-transmission-a...</a></li>
<li><a href="http://lfroen.livejournal.com/">http://lfroen.livejournal.com/</a></li>
</ul>