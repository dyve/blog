+++
date = "2009-06-26T07:20:01+00:00"
draft = true
tags = ["JustMigrate", "bluetooth", "iphone"]
title = "iPhone localhost bluetooth"
+++
After changing iPhone settings (for example, to <a href="http://help.benm.at/tethering.php">enable Tethering</a>) your iPhone bluetooth identifier may change to <i>localhost</i>. Since that is not a very descriptive name, you probably want to change it. You can do it by following these steps (they may be overkill, but it worked like this for me):<br />

<ol><li>Remove the Bluetooth device <i>localhost</i>.<br /></li><li>Connect your iPhone to iTunes.<br /></li><li>Wait for it to sync (if you haven&#39;t set it to automatically sync, you can skip this step).</li><li>In iTunes, find your iPhone in the left sidebar. Click the name of your iPhone once. It will become editable.</li>

<li>Change the iPhone&#39;s name to something else (I just appended the letter &#39;x&#39;). Press Enter. Your iPhone&#39;s screen will very briefly show &quot;Synchronizing&quot;.</li><li>Change the iPhone&#39;s name back to its original name. Press Enter. iPhone screen will again briefly show &quot;Synchronizing&quot;.</li>

<li>Start Bluetooth, connect and configure your iPhone, it will show the name you gave it in the previous step.</li></ol>That&#39;s all, nothing to it.