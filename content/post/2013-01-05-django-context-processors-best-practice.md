+++
date = "2013-01-05T08:01:00+00:00"
draft = true
tags = ["JustMigrate", "django"]
title = "Django Context Processors Best Practice"
+++
<div class="posterous_bookmarklet_entry">
      <blockquote class="posterous_long_quote"><p>Add this at the top of your settings.py file:</p>

<div class="wp_syntax"><table><tr><td class="code"><div class="CodeRay">
  <div class="code"><div class="CodeRay">
  <div class="code"><pre>import django.conf.global_settings as DEFAULT_SETTINGS</pre></div>
</div>
</div>
</div>
</td></tr></table></div>

<p>Then extend the default context processors:</p>

<div class="wp_syntax"><table><tr><td class="code"><div class="CodeRay">
  <div class="code"><div class="CodeRay">
  <div class="code"><pre>TEMPLATE_CONTEXT_PROCESSORS = DEFAULT_SETTINGS.TEMPLATE_CONTEXT_PROCESSORS + (
&quot;myapp.context_processors.example&quot;,
&quot;myapp.context_processors.other_example&quot;,
# etc...
)</pre></div>
</div>
</div>
</div>
</td></tr></table></div>

</blockquote>

<div class="posterous_quote_citation">via <a href="http://blog.madpython.com/2010/04/07/django-context-processors-best-practice/">blog.madpython.com</a></div>
    <p></p></div>