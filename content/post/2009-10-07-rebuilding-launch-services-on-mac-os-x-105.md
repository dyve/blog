+++
date = "2009-10-07T20:50:00+00:00"
draft = true
tags = ["JustMigrate", "leopard", "mac", "snow leopard"]
title = "Rebuilding Launch Services on Mac OS X 10.5+"
+++
<p>Here&rsquo;s the command, works on both Leopard and Snow Leopard:</p>

<div class="CodeRay">
  <div class="code"><pre>/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user /</pre></div>
</div>


<p>(It&rsquo;s one long command, not multiple separate lines)</p>