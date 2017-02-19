+++
date = "2012-08-20T07:12:32+00:00"
draft = true
tags = ["JustMigrate", "google", "iphoto", "mac", "picasa"]
title = "Uninstalling Picasa Web Albums iPhoto Plugin"
+++
<p>Google used to publish a plugin for iPhoto that added an export option to Picasaweb. Since I don't use that service anymore, I wanted to delete the plugin. However, the instructions to remove it did not work. Apparently, the plugin changed locations somewhere between Tiger and Mountain Lion. <p /> A little investigating revealed the correct location in Mountain Lion, to remove the Picasa Web Albums Exporter, follow these steps:</p>
<ol>
<li>Close iPhoto&nbsp;</li>
<li>sudo rm /Library/Application Support/iPhoto/PlugIns/PicasaWebAlbums.iPhotoExporter&nbsp;</li>
<li>Start iPhoto&nbsp;</li>
</ol>
<p>Done!</p>