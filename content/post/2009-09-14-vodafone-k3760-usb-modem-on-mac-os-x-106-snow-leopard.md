+++
date = "2009-09-14T10:21:00+00:00"
draft = true
tags = ["JustMigrate", "mac", "snow leopard", "vodafone"]
title = "Vodafone K3760 USB modem on Mac OS X 10.6 Snow Leopard"
+++
<p><em>Disclaimer: Try this at your own risk. This should be a temporary fix until Vodafone publishes its own K3760 Snow Leopard compatible software.<br /></em></p>
<p>The Vodafone K3760 USB modem (black USB stick) is currently not supported on Mac OS X Snow Leopard (10.6). However, you can get it to work by combining the latest Vodafone Mobile Broadband software (VMB, formerly VMC) with the OEM driver (OEM = Original Equipment Manufacturer).</p>
<p>This is a step by step guide. You may or may not get some kext errors every now and then during install, just ignore them.</p>
<ol>
<li>Download software  
<ul>
<li>VMB for Mac (latest version at the time of writing: v3.04.06.00)<br /><a href="http://www.business.vodafone.com/site/bus/public/enuk/support/10_productsupport/laptop_connectivity/40_software/software/10_latest/p_mac.jsp">http://www.business.vodafone.com/site/bus/public/enuk/support/10_productsuppo...</a></li>
<li>OEM driver (K3760 is a rebranded Option iCon 431)<br />You just need the driver from the linked page below (latest version at the time of writing: 3.26.0)<br /><a href="http://www.option.com/en/support/software-download/usb-modems/icon431/">http://www.option.com/en/support/software-download/usb-modems/icon431/</a></li>
</ul>
</li>
<li>Install VMB  
<ul>
<li>Make sure your K3760 is not plugged in</li>
<li>Mount the DMG you downloaded</li>
<li>Run the uninstaller (no reboot required)</li>
<li>Run the installer</li>
<li>Reboot (but do not connect your K3760)</li>
</ul>
</li>
<li>Install the Option iCon 431 driver</li>
</ol>
<p>That's it! Run the VMB software and make sure it all works. Note that this newest VMB doesn't require you to set up a modem and manually dial up with the K3760, everything is done for you.</p>