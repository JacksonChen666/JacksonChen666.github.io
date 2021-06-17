---
layout: post
title: Your Mac has the ability to create wired network for your iPhone
author: JacksonChen666
date: 2021-06-17 20:19 +0200
category: apple
---
Clickbait? No clue, but it's possible for anyone to hook up your iPhone's charger to charge it, and enable the wired network sharing for your iPhone on the Mac, and I will show you how to do so.

## Prerequisites:
- An iPhone (support may be wide)
- A Mac (support may also be wide)
- An iPhone charger with data transfer capabilities [^1] (power only = no wired network for your iPhone)
- Optionally, a USB-C hub if your Mac is USB-C

## Steps:
1. Connect your iPhone to your Mac, using the charging cable.
2. Open System Preferences
    1. Navigate to the sharing window
    <img src='/assets/img/posts/mac-iphone-wired/system-preferences.png' loading="lazy" alt="Screenshot of macOS's System Preferences">
    2. Navigate to "Internet Sharing" service
        <img src='/assets/img/posts/mac-iphone-wired/internet-sharing-section.png' loading="lazy" alt="Screenshot of macOS's System Preferences Sharing pane highlighting the Internet Sharing section">
        1. Choose the device you want to share the internet from the dropdown
        <img src='/assets/img/posts/mac-iphone-wired/internet-sharing-share-from.png' loading="lazy" alt="Screenshot of macOS's System Preferences Sharing pane highlighting the dropdown menu to share the connection from.">
        2. Choose the "computer" called iPhone USB (and optionally other devices [^2])
        <img src='/assets/img/posts/mac-iphone-wired/internet-sharing-share-to.png' loading="lazy" alt="Screenshot of macOS's System Preferences Sharing pane highlighting the menu list showing devices it can share an internet connection to.">
    3. Enable the "Internet Sharing" service by ticking the box next to the "Internet Sharing" service
    <img src='/assets/img/posts/mac-iphone-wired/network-disruption.png' loading="lazy" alt='Screenshot of macOS System Preferences Sharing pane showing a warning message saying: "Are you sure you want to turn on Internet sharing? If your computer is connected to a network, turning on Internet sharing may affect the network settings of other computers and disrupt the network. Contact your system administrator before turning on Internet sharing."'>
    macOS may tell you that what you are about to do might disrupt the network and change network settings of other computers. If you use an enterprise network (office, school, etc), I'd recommend checking with your system/network administrator to see if the "Internet Sharing" service will not disrupt the network.

## Speed tests
Disclaimer: This is not the most controlled test I've done, since there are client inconsistencies.

| Test type | Download Speed | Upload Speed |
|-----------|----------------|--------------|
| ISP max | 1000 Mbit/s | N/A |
| Mac with ethernet | 847.94 Mbit/s | 283.28 Mbit/s |
| Mac with ethernet, while shared to iPhone | 685.22 Mbit/s | 287.47 Mbit/s |
| iPhone on wireless | 38.4 Mbit/s | 47.6 Mbit/s |
| iPhone on Mac shared wired network | 324 Mbit/s | 279 Mbit/s |
| Mac with ethernet, shared, simultaneous | 506.95 Mbit/s | 174.76 Mbit/s |
| iPhone with shared network, simultaneous | 322 Mbit/s | 224 Mbit/s |

<p/>

## How does this work?
Note: I'm not sure where to find sources that explain how it works, so I am just going to assume how it works.

Most of the magic should happen in the charging cable, where the Mac sends in and out the internet stuffs to/from the iPhone via the data line of the charging cable. The data line can be used for backing up, and restoring the iPhone, including the wired network capabilities.

## Conclusion
This post shows how to use a Mac system and some iPhone charging cables to create a system where the charging cable for your iPhone is the ethernet cable, like how computers have it. I hope this post was useful. Any questions can be directed to my [twitter dms](https://twitter.com/messages/compose?recipient_id=909886275741679616).

[^1]: Data transfer capabilities meaning that you can backup your iPhone, restore it, etc. Though, I cannot confirm if that's what's required.
[^2]: Choosing an ethernet port as a device to share to may result in changing the network settings of your ISP, potentially resulting in ISP downtime, and your ISP may terminate your service. **THE AUTHOR IS NOT RESPONSIBLE AND LIABLE FOR ANY DAMAGES CAUSED BY THE USER. ENABLE AT YOUR OWN RISK** <img src='/assets/img/posts/mac-iphone-wired/isp-disruption.png' loading="lazy" alt='Screenshot of macOS System Preferences Sharing pane showing a warning message saying: "If you turn on this port, your Internet Service provider might terminate your service to prevent you from disrupting its network. In some cases (if you use a cable modem, for example) you might unintentionally affect the network settings of your ISP and violate the terms of your service agreement."'>