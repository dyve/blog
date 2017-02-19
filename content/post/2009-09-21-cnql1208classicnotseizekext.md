+++
date = "2009-09-21T06:04:29+00:00"
draft = true
tags = ["JustMigrate", "canon", "mac", "snow leopard"]
title = "CNQL1208_ClassicNotSeize.kext"
+++
<p>If you have an older Canon scanner attached to your Mac, you're lucky, because Canon is very good at keeping older hardware drivers up to date. The usual update procedure is that you delete the previous driver using their DelDrv application, and then install a new driver.</p>
<p>Unfortunately, DelDrv requires Rosetta to run, and some Snow Leopard users are trying to keep Rosetta off their machines. I'm one, and until now, I've been successful.</p>
<p>After updating my Canon drivers, I routinely encountered an error message stating</p>
<blockquote class="posterous_short_quote"><code>/System/Library/Extensions/CNQL1208_ClassicNotSeize.kext</code> could not be loaded</blockquote>
<p>A little research showed that this was part of the old Canon driver that should have been deleted by the DelDrv application which I did not run. I manually removed the file (you can either do this through Finder or using the command line). My scanner has been working fine afterwards, and there were no other ill effects that I noticed. I just thought I'd share this info for anyone else that was bothered by the error. It's fine to delete <code>/System/Library/Extensions/CNQL1208_ClassicNotSeize.kext</code>.</p>