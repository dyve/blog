+++
date = "2007-07-17T14:59:00+00:00"
draft = true
tags = ["JustMigrate", "iphoto", "mac", "picasa"]
title = "Picasa to iPhoto"
+++
<p>If there's one application I will be missing when the switch is complete, it will be Picasa. It's almost perfect. Light weight, fast startup time, lightning response. From what I've read online, iPhoto will probably be a bit slower. I'm hoping the excellent integration will make up for this.  What did I do to move from Picasa to iPhoto?</p>
<ul>
<li>Made a Picasa backup to a USB hard drive.</li>
<li>Copied the backup folder from the USB drive to the Mac.</li>
<li>Imported the newly copied folder into iPhoto.</li>
<li>Deleted the imported folder (iPhoto makes copies when importing).</li>
</ul>
<p>I could have imported directly from the USB drive, but I thought this would be faster.  After importing, I noticed that Front Row reported "No pictures in my library". I took me a while to find out what was wrong, but eventually (thanks to some Googling) I found out that iPhoto sometimes writes bad XML to it's AlbumData.xml file.  To fix it:</p>
<ul>
<li>Close iPhoto.</li>
<li>Load AlbumData.xml into Safari.</li>
<li>Safari will attempt to parse the XML. If it's invalid, it'll tell you the number of the offending line.</li>
<li>Load AlbumData.xml into a text editor and fix the XML.</li>
<li>Repeat until valid.</li>
<li>Enjoy.</li>
</ul>
<p>Next: iTunes.</p>