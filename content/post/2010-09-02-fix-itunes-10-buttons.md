+++
date = "2010-09-02T18:11:00+00:00"
draft = true
tags = ["JustMigrate", "itunes", "mac"]
title = "Fix iTunes 10 buttons"
+++
<p>iTunes 10 has a non-standard position for the buttons in the top left corner of the screen (close, minimize to dock, maximize window). Fortunately there is an easy method to set them to standard behavior.</p>

<p>Close iTunes. Start Terminal.</p>

<p>To set the buttons to the standard horizontal format:</p>

<div class="CodeRay">
  <div class="code"><pre>defaults write com.apple.iTunes full-window -1</pre></div>
</div>


<p>To set the buttons to the iTunes 10 vertical format:</p>

<div class="CodeRay">
  <div class="code"><pre>defaults write com.apple.iTunes full-window -boolean NO</pre></div>
</div>


<p>These command were posted by <a href="http://twitter.com/rudyrichter">@rudyrichter</a>. Thanks Rudy!</p>