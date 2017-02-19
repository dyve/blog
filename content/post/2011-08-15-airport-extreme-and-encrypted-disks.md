+++
date = "2011-08-15T06:14:19+00:00"
draft = true
tags = ["JustMigrate", "airport extreme", "backup", "mac", "time machine"]
title = "Airport Extreme and encrypted disks"
+++
<p>My Macbook's Time Machine backs up to an encrypted USB disk. I was contemplating moving the disk to my Airport Extreme to free up a USB port and have Time Machine work when I am not connected to my Cinema Display (which acts as a hub for all my peripherals).&nbsp;However, I couldn't find any documentation on whether or not Airport Extreme accepts Lion encrypted volumes as Air Disks.</p>
<p>So I did what any sensible geek would do. I unplugged my encrypted 1TB backup disk from the USB hub and plugged it into the Airport Extreme.</p>
<p>The results were interesting. Airport extreme recognized the physical disk (it showed up with its make, model and size specified), but not the encrypted logical volume. After switching it back from the Airport Extreme back to my USB hub, the Macbook recognized the encrypted volume and started backing up as usual.</p>