+++
date = "2009-03-04T09:47:00+00:00"
draft = true
tags = ["JustMigrate", "quicksilver", "twitter"]
title = "Improved Twitter for Quicksilver (Tweet.scp)"
+++
<p>Just wanted to share this with anyone that's interested. I've been using an improved version of <a href="http://blog.codahale.com/2007/01/15/tweet-twitter-quicksilver/" target="_blank">Coda Hale's Tweet.scp</a> for a while now. Thank you all that contributed. Twittering has never been easier than [Ctrl+Space][.]&lt;type message&gt;[Tab][t][w][Enter]. I especially like the Growl feedback.  However, something was missing, especially length checking (Quicksilver should show the length of the text you're typing btw, that would be awesome) and proper url encoding (the original truncates the message when you use an ampersand "&amp;" in your tweet).  So, without any further ado, here's my improved Tweet.scp! Follow the instructions in <a href="http://blog.codahale.com/2007/01/15/tweet-twitter-quicksilver/" target="_blank">Coda Hale's original post</a> to install!  <code> </code></p>
<div class="CodeRay">
  <div class="code"><pre>-- Original: http://blog.codahale.com/2007/01/15/tweet-twitter-quicksilver/
-- Improvements by various people working on this script
-- Dylan Verheul 2009-01-30: added encodeURL and length check

using terms from application &quot;Quicksilver&quot;
on process text tweet
set tweetLength to count (tweet)
if tweetLength is greater than 140 then
growlNotify(&quot;Tweet not sent&quot;, &quot;Tweet is too long, 140 chars max!&quot;)
else
tell application &quot;Keychain Scripting&quot;
set twitter_key to first Internet key of current keychain whose server is &quot;twitter.com&quot;
set twitter_login to quoted form of (account of twitter_key &amp; &quot;:&quot; &amp; password of twitter_key)
end tell
set twitter_status to quoted form of (&quot;source=quicksilver&amp;status=&quot; &amp; encodeURL(tweet))
set results to do shell script &quot;curl --user &quot; &amp; twitter_login &amp; &quot; --data-binary &quot; &amp; twitter_status &amp; &quot; http://twitter.com/statuses/update.json&quot;

-- display dialog results
my growlRegister()
growlNotify(&quot;Tweet Sent&quot;, tweet)

return nothing
end if

end process text
end using terms from

-- Do Growl stuff

using terms from application &quot;GrowlHelperApp&quot;
-- Register Growl
on growlRegister()
tell application &quot;GrowlHelperApp&quot;
register as application &quot;Tweet&quot; all notifications {&quot;Alert&quot;} default notifications {&quot;Alert&quot;} icon of application &quot;Script Editor.app&quot;
end tell
end growlRegister

-- Notify using Growl
-- Example: growlNotify(&quot;This is an Alert&quot;,&quot;This is a test of the Growl Alert System&quot;)
on growlNotify(grrTitle, grrDescription)
tell application &quot;GrowlHelperApp&quot;
notify with name &quot;Alert&quot; title grrTitle description grrDescription application name &quot;Tweet&quot;
end tell
end growlNotify
end using terms from

-- And finally, this handler makes text &quot;URL-encoded&quot; so that any text can be used with cURL

on encodeURL(someURL)
return do shell script &quot;/usr/bin/python -c '&quot; &amp; ¬
&quot;from sys import argv; &quot; &amp; ¬
&quot;from urllib import quote; &quot; &amp; ¬
&quot;print quote(unicode(argv[1], \&quot;utf8\&quot;))' &quot; &amp; quoted form of someURL
end encodeURL</pre></div>
</div>