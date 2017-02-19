+++
date = "2007-08-01T02:48:00+00:00"
draft = true
tags = ["JustMigrate", "front row", "iphoto", "mac", "picasa"]
title = "iPhoto problems"
+++
<p>I noticed that Front Row didn't like my iPhoto library. Even though I have over 20,000 photo's in there, it kept reporting my iPhoto library was empty.</p>
<p>A little Googling gave me a partial answer in the form of <a href="http://derivadow.com/2006/12/30/iphoto-photos-not-appearing-in-front-row/">this blog post</a>. However, it was not immediately clear what I really needed to do. Using the instructions mentioned earlier, I noticed that my AlbumData.xml was corrupted, and the corruption was in the master keyword list.</p>
<p>I went to iPhoto, started the preferences, and navigated to the Keywords pane. There I removed all the Picasa keywords that were imported. For me, this wasn't a big issue, since I hardly used them. If you're heavy on keywords, you might just want to try and manually fix the keywords in iPhoto, I suggest removing and adding them.</p>
<p>After that, my Front Row integration problems were gone!</p>