+++
date = "2008-12-15T02:24:00+00:00"
draft = true
tags = ["JustMigrate"]
title = "Apple TV 2.3 - What I did"
+++
<h2>Step 1: Factory restore to 1.0</h2>

<p>I assume you can also downgrade to 1.1 to make this work, but my Apple TV is a 1.0 version. You can use either the menu (Settings) or the remote (hold Menu and Down for about 6 seconds) to accomplish this.</p>

<h2>Step 2: Patchstick to enable SSH</h2>

<p>The same patchstick I have been using since Take 2 worked for me. If you don&rsquo;t have a patchstick, check out <a href="http://code.google.com/p/atvusb-creator/">http://code.google.com/p/atvusb-creator/</a>. Don&rsquo;t worry about installing software (unless that is what you want), the goal is to enable SSH.</p>

<h2>Step 3: Set up SSH</h2>

<p>We want to autologin as user frontrow, using SSH authorized_keys. Once your Apple TV is ssh enabled, launch a terminal and type this:</p>

<div class="CodeRay">
  <div class="code"><pre>ssh -l frontrow appletv.local</pre></div>
</div>


<p>You should get a password prompt. The password is frontrow. Once you enter that, you should be on the command line of your Apple TV. Mine looks like this:</p>

<div class="CodeRay">
  <div class="code"><pre>-bash-2.05b$</pre></div>
</div>


<h2>Step 4: Enable AFP</h2>

<p>Download this script to your home dir: <a href="http://www.benmackin.com/stuff/afpinstall.sh">http://www.benmackin.com/stuff/afpinstall.sh</a></p>

<p>From your Terminal prompt on your Mac (so logout of Apple TV) type:</p>

<div class="CodeRay">
  <div class="code"><pre>scp -1 afpinstall.sh frontrow@appletvlocal:~</pre></div>
</div>


<p>Now ssh to your Apple TV, and type:</p>

<div class="CodeRay">
  <div class="code"><pre>sudo sh afpinstall.sh</pre></div>
</div>


<p>You will be prompted for a password, which is, as always frontrow. After this, your Apple TV is afp enabled, and from Finder on your Mac you could mount (Cmd-K) afp://<a href="mailto:frontrow@appletv.local">frontrow@appletv.local</a>/frontrow/frontrow.</p>

<h2>Step 5: Install ATVFiles (version 1.2)</h2>

<p>Download the most recent version of ATVFiles from this page: <a href="http://wiki.awkwardtv.org/wiki/ATVFiles">http://wiki.awkwardtv.org/wiki/ATVFiles</a> Use scp or your brand new afp mount to copy the file to your Apple TV.Then ssh to your Apple TV, and type:</p>

<div class="CodeRay">
  <div class="code"><pre>sudo sh ATVFiles-1.2.0.run</pre></div>
</div>


<p>If you have a newer version of ATVFiles, change the file name to match. You will again be prompted for the now familiar password, frontrow. When asked if you want to reboot the Finder, answer Yes. You now have ATVFiles.</p>

<h2>Step 6: Install Perian</h2>

<p>(to be added)</p>