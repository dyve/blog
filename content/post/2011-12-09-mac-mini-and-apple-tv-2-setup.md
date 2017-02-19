+++
date = "2011-12-09T07:11:21+00:00"
draft = true
tags = ["JustMigrate", "apple tv", "itunes", "mac", "software", "video"]
title = "Mac Mini and Apple TV 2 Setup"
+++
<p>Here is my current setup for finding, downloading and viewing TV shows.</p>
<p><strong>Devices</strong></p>
<p>It uses 2 devices, a Mac Mini and an Apple TV 2. The Mac Mini is run headlessly (without a monitor, without a keyboard) from a closet. The Apple TV is connected to the big screen in the living room. The Mac Mini and the Apple TV are "connected" using iTunes Home Sharing.</p>
<p>I use both the original Apple TV remote as well as the Remote App for iPad and iPhone. The Apple TV 2 is also connected a 5.1 surround receiver. Using AirPlay I can play music from iOS to the Apple TV (which is my main way of listening to music).</p>
<p>All of the devices run the regular Apple software, no jailbreaks applied.</p>
<p>The Mac Mini's jobs are:</p>
<ul>
<li>Keep a list of TV shows I like.</li>
<li>Find new episodes of my TV shows and download them.</li>
<li>Convert downloaded TV shows to iTunes format, if possible by remuxing, if needed by reencoding.</li>
<li>Accept manually added torrent files from trusted locations.</li>
<li>Download added Torrent files.</li>
<li>Keep iTunes running.</li>
</ul>
<p>The Apple TV 2's jobs are:</p>
<ul>
<li>Be quiet and unobtrusive.</li>
<li>Play audio and video when told.</li>
<li>Do AirPlay magic to TV and receiver.</li>
</ul>
<p><strong>Software</strong></p>
<ul>
</ul>
<p>The Mac Mini uses this:</p>
<ul>
<li><a href="http://www.utorrent.com/" target="_blank">uTorrent</a>
<ul>
<li>downloads torrent files&nbsp;from a <a href="http://showrss.karmorra.info/" target="_blank">ShowRSS</a> feed (TV Shows)</li>
<li>downloads torrents from a shared <a href="http://db.tt/Oi18HJn" target="_blank">Dropbox</a> folder (anything else)</li>
<li>stores finished downloads in a folder for incoming media</li>
</ul>
</li>
<li><a href="http://itunes.apple.com/us/app/ivi/id402279089" target="_blank">iVI</a>
<ul>
<li>converts incoming movies to MP4-format</li>
<li>adds TV- and movie information</li>
<li>adds downloaded subtitles</li>
<li>adds the file to iTunes</li>
</ul>
</li>
<li><a href="http://code.google.com/p/subler/" target="_blank">Subler</a>
<ul>
<li>for manually adding/removing MP4 audio and subtitles</li>
</ul>
</li>
<li><a href="http://itunes.apple.com/nl/app/identify/id418080764" target="_blank">iDentify</a>
<ul>
<li>for manually adding TV-show and movie information</li>
</ul>
</li>
<li><a href="http://handbrake.fr/" target="_blank">HandBrake</a>
<ul>
<li>if iVI fails to convert a video, HandBrake comes to the rescue</li>
</ul>
</li>
<li><a href="http://www.noodlesoft.com/hazel.php" target="_blank">Hazel</a>
<ul>
<li>for automatically moving files</li>
</ul>
</li>
<li><a href="http://code.google.com/p/jbiersubdownloader/" target="_blank">jBierSubDownloader</a>
<ul>
<li>for downloading subtitles</li>
</ul>
</li>
<li>Screen sharing so I can access the Mac Mini from my iPad, MacBook, et cetera.</li>
</ul>
<p>The essential apps in the above list are uTorrent and iVI. My setup is a little complicated because my wife prefers to watch shows and movies wih English subtitles.</p>
<p><strong>No jailbreaking</strong></p>
<p>I spent a lot of time hacking and jailbreaking an Apple TV 1 to do it all. The results were pretty good, but the setup was prone to crashes, overheating. Also, every Apple software update meant my setup would stop working. So when the Apple TV 2 came out, I bought a use Mac Mini. It was an investment, but it's working like a charm. Also, it doubles as my e-mail backup machine (POP3 Gmail), <a href="http://www.crashplan.com" target="_blank">CrashPlan</a> backup location. Now every time a software update appears, I can just install it, and the setup continues to work like a charm.</p>