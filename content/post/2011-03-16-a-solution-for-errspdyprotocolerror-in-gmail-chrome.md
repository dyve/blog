+++
date = "2011-03-16T05:45:47+00:00"
draft = true
tags = ["JustMigrate", "chrome", "gmail", "google"]
title = "A solution for ERR_SPDY_PROTOCOL_ERROR in Gmail / Chrome"
+++
An unlucky combination of Gmail and Chrome seems to cause users not <br />being able to log in. I was among these this morning. After a little <br />trial and error, this worked for me: <p /> - Clear Chrome's browser cache <br />- Restart Chrome <br />- Go to <a href="http://www.google.com">www.google.com</a> <br />- Sign in and go to Gmail <p /> Good luck if you are suffering from the ERR_SPDY_PROTOCOL_ERROR also. <br />Remember that you can also pick another browser, the problem seems <br />confined to Chrome.