+++
date = "2008-12-29T09:20:00+00:00"
draft = true
tags = ["JustMigrate"]
title = "Old CSS hacks never die"
+++
<p>I needed a min-height and felt bad about leaving IE 6 behind. Good old</p>

<div class="CodeRay">
  <div class="code"><pre><span class="constant">#container</span> { <span class="key">min-height</span>:<span class="float">500px</span>; }
<span class="type">*</span> <span class="type">html</span> <span class="constant">#container</span> { <span class="key">height</span>:<span class="float">500px</span>; }</pre></div>
</div>


<p>still works!</p>