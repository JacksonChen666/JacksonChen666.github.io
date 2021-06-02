---
layout: post
title: Behind the Scenes of the Fastest Arch Linux Install Speedrun of My Life
author: JacksonChen666
category: behind-the-scenes
date: 2021-06-01 20:51 +0200
last_modified_date: 2021-06-02 16:46 +0200
---
OK so, 55.6 seconds. And all you did is nothing during the install. HOW?

(If you haven't watched it, then [here](https://youtu.be/wODYO2RnBts))

To put it simply: Unofficial baseline Arch Linux ISO with scripts and packages, and a discovery that I put to use to avoid coping files from one place to another.

## The ISO
The first thing that I did is to remove the unnecessary stuff for a bare system: the entire GUI, some *"essential packages"* too (linux-firmware for the curious cause linux has like enough support already for VMs), and then built on top of the baseline profile, which had a size of ~300 MB as the final ISO unmodified. I added some offline packages, pointed the package cache to the offline packages location for pacman (to avoid file copying to an empty cache), used `zstd -1` compression for everything: the initrd, ISO, and the installed system's initrd, then finally, copied the ISO to macOS.

The total size of the ISO grew to ~580 MB, which was something but package sizes are a thing apparently (like, what do you expect when using offline packages).
Still less than releng which is full of unnecessary tools for a speedrun.

Now I have more to explain, cause there is more than offline packages reducing the time of the speedrun.

### Booting
Yep, boot times matter. It matters so much I turned off boot messages.
It really helps reducing the time by so slightly it can affect the speedrun as a whole.
Having to repaint the screen a lot of times (more than the cursor itself) can really add up the time that you might spend a full day on boot messages totalling many years of your life.

### Automatic Login
Too bad that the baseline profile provided doesn't include automatic login like the releng profile.
Guess I'll have to copy paste a file to the systemd folder of services and wants and targets to make the command executed automatically, so it can actually login automatically.

### Automating the Installation
"How did you do nothing during the install and it worked?" Well, pacman still outputs warning (despite the fact I told it to not output), so there is something going on.
But what is actually going on is simple enough as releasing the "[source code][source]" of the ISO (there seems to be parts of it licensed as GPLv3, guess I'll die if I don't release to requests of [source code][source]), or just actually explaining like a normal person.

#### Launching the script
The script must be launched after the user automatically logs in, which can be done using some files that the bash shell would execute on execution of bash.
I am not bothered trying to remember what file it was while writing this post, but it's most likely not `~/.bashrc`.

#### Partitioning
Because I was too lazy and made the ISO EFI support only, partitioning is done with the almighty tool called `sfdisk` (script oriented fdisk).

Fdisk is apparently a tool not intended for GPT partitions (manages to work anyways), so I guess I did a stupid the whole time of installing Arch Linux (but dang the curses version is better than gdisk (gdisk doesn't full width the partitions, making it look a bit odd)).
I used it to partition a 512MiB boot, and the rest for root. I also specified their types with UUID, so systemd can just boot without having to fuss with changing the options for the boot loader.

#### Installing the packages
I've already made a post about making custom Arch Linux ISOs with offline packages, and that applies.
What didn't apply last time that now applies, is changing the pacman configuration file to point the packages cache to the offline packages location.
Such improvement improved the time from "copying files speed and also decompressing" to "big time saver that should be impossible" (it's possible).

The packages of choice were: base and linux.
That is all the packages required to run a Arch Linux system with pacstrap.

### Rebooting
`reboot` and that's it. Not much to see here after all.

### Booting to the installed system
`root=` wasn't included, so I had to rely on the `systemd` hook in initrd to auto detect the partition and boot to that partition with the correct type (Linux Root x86_64 type).
Booting can also be fast, because I used systemd-boot, not GRUB (GRUB is ever so slightly slower).

(wow there is a high dependency of systemd here: boot loader, inird, and the system itself?)

## The VM
I could've used QEMU KVM capabilities, but Plasma KDE has proved to be unusable with OBS (OBS and Plasma both runs at 5 fps when OBS, and I have no more machines that are more powerful). Because of that, I decided to move to VirtualBox on macOS.

The VM setup is: RAMDisk containing the ISO, the VM drive, and the RAM for the VM is in the RAM as usual.
It also uses EFI because on BIOS, because you are spending literal seconds of animation that is not required to play, but does anyways, slowing down yourself so much that you lose trying to get first place, and then question can ever do a speedrun that's first place, who had the seemingly average time of 1:13 minutes (seconds? my brain is rushing this post and couldn't understand such thing for a while now idk).
The controller was also VirtIO because it's fast (noticeably faster that I question myself if it's actually faster than the preset VirtualBox gives).

## Further possible improvements
### Booting
Loading a base system, or even a rescue environment doesn't take the same amount of time to boot normally.
Not booting to `multi-user.target` but instead a custom target that installs can possibly be much faster, because of boot times.

### Finishing installation
`reboot -ff` because it's too fast. Way too fast.

### Avoiding the system and using only systemd
Yep, that was actually the original idea of the speedrun, but I got lazy. I might work on the idea lol.

What this means is to use targets and services that start after some level of usability (IO, script, etc.) and not booting to `multi-user.target`, because that's a lot of things to load and I don't have time for that.

### Support for BIOS
Installing of course, and not much here.

## Is this for real?
Yeah lol. I didn't install a system before hand, and you use the speedrun ISO yourself too! (in a VM, of course)

## [Source Code][source] for ISO
No downloaded packages, just a few config files and that's it. Download the packages yourself then make the ISO.

Instructions will be on the repo itself.

## Conclusion
i'm first. try to beat me with faster hardware or better virtualization speeds lol. i'm actually not sure if I actually got 30 seconds on the speedrun using QEMU KVM (i didn't do it on recording **because lag**), but improvements can be made to make it much much faster.

[source]: https://github.com/JacksonChen666/arch-linux-ultra-install-speedrun