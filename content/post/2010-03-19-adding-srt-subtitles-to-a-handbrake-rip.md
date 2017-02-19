+++
date = "2010-03-19T04:18:00+00:00"
draft = true
tags = ["JustMigrate", "apple tv"]
title = "Adding .SRT subtitles to a Handbrake rip"
+++
<p><a href="http://handbrake.fr/">Handbrake</a> recently started to offer to option to include subtitles from a SRT file when ripping/converting. I tried this yesterday when converting a 720p MKV file to the standard Apple TV format.</p>
<p>Initially the conversion seemed to fail, because Handbrake immediately reported it was done, without creating &nbsp;new file. The cause turned out to be an error in the SRT file. I fixed this by running it through <a href="http://www.jubler.org/">Jubler</a> (load, save, done). Then the conversion ran smoothly.</p>
<p>The resulting MP4 file seemed fine. It played well in QuickTim eon my Mac (including subtitles). However, my Apple TV refused to show any subtitles, and keeping the Play button on the remote pressed (this leads to subtitle selection while playing QuickTime files on Apple TV) only led to pausing, not the expected options screen.</p>
<p>I ran the MP4 through&nbsp;<a href="http://code.google.com/p/subler/">Subler</a>, deleting the subtitle tracks and remuxing them from the original files. After that, everything worked fine (video, audio and subtitles) on both Mac and Apple TV.</p>
<p>Apologies for the boring post, it's just here in case anyone runs into the same problem, and uses Google to find out what's going wrong.</p>