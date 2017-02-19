+++
date = "2012-07-30T12:05:00+00:00"
draft = true
tags = ["JustMigrate", "mac", "pip", "programming", "python", "virtualenv"]
title = "Fixing Python, virtualenv and pip on Mountain Lion"
+++
<div class="posterous_bookmarklet_entry">If you are a developer on OS X using Python, pip, or virtualenv, you will probably see errors after the upgrade to Mountain Lion. Here's a fix:</div>
<div class="posterous_bookmarklet_entry"><strong>1. Install or reinstall Command Line Tools</strong></div>
<div class="posterous_bookmarklet_entry">Some people report that using the <a href="http://adcdownload.apple.com/ios/ios_simulator__resigned/cltools_mountainliondp2_march12.dmg" target="_blank">direct download</a> works better than installing via Xcode. I don't use Xcode so I went for the aforementioned link.</div>
<div class="posterous_bookmarklet_entry"><strong>2. Install or reinstall pip and virtualenv</strong></div>
<div class="posterous_bookmarklet_entry">Start terminal and type:</div>
<blockquote>
<div class="posterous_bookmarklet_entry">sudo easy_install pip</div>
<div class="posterous_bookmarklet_entry">sudo pip install virtualenv</div>
<div class="posterous_bookmarklet_entry">sudo pip install virtualenvwrapper</div>
</blockquote>
<div class="posterous_bookmarklet_entry">
<p>This worked for me. Some people report more trouble. If you aren't up and running after this, please look at <a href="http://martinbrochhaus.com/2012/07/mountain-lion.html" target="_blank">this longer blog post by Martin Brochhaus</a>.</p>
</div>