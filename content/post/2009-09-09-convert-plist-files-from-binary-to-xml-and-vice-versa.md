+++
date = "2009-09-09T07:18:00+00:00"
draft = true
tags = ["JustMigrate", "mac"]
title = "Convert .plist files from binary to xml (and vice versa)"
+++
<p>Mac OS X&rsquo;s .plist files come in 2 formats: binary (requires a special editor) and XML (any text editor will do). OS X also comes with a command line utility that will convert a .plist file from binary to xml or from xml to vinary. That utility is called plutil.</p>

<p>To convert a file to XML format, type:</p>

<div class="CodeRay">
  <div class="code"><pre>plutil -convert xml1 some_file.plist</pre></div>
</div>


<p>To convert a file to binary format, type:</p>

<div class="CodeRay">
  <div class="code"><pre>plutil -convert xml1 some_file.plist</pre></div>
</div>


<p>For more information about plutil, type:</p>

<div class="CodeRay">
  <div class="code"><pre>man plutil</pre></div>
</div>