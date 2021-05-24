---
title: Making and Building Custom Arch Linux ISOs
layout: post
date: '2021-04-03 14:41:12 +0200'
category: Arch-Linux
author: JacksonChen666
---
I discovered that you can make custom Arch Linux ISOs like how the Arch Linux developers do.
I then proceeded to understand how it's done and make an ISO that's completely independent of the network in the installation phase.

How did I install Arch Linux without using the internet?
Well, it all boils down to a few things that you have to do before waiting some time to produce the usable ISO.
Now, the people of Arch Linux (or the community) has created a wiki page entirely on:

- [Downloading packages for offline installation](https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Installing_packages_from_a_CD/DVD_or_USB_stick)
- [Adding more to the normal ISOs](https://wiki.archlinux.org/index.php/Archiso#Prepare_a_custom_profile)
- [Building an entire ISO that can be used like official ISOs](https://wiki.archlinux.org/index.php/Archiso#Build_the_ISO) (except they are not official)

With the wiki pages in existence, I could possibly build an ISO with scripts assisting the installation, and make the installation depend on the ISO only.
Maybe even make an entire post out of it to show how simple (in my opinion) it is to make an installation.

## Installing the Required Tools
NOTE: I did not have to experience any of the weird errors and extra stuff I had to get manually.
I am going to continue assuming you have solved issues on your own (if any does rise up).
I have also built the arch linux ISOs on a virtual machine.
I may have skipped a few things that the wiki suggests you to do.

Firstly, install the [archiso](https://archlinux.org/packages/extra/any/archiso/) package.

Secondly, fix any issues.

Thirdly, move on to the next section.

## Preparing a Custom Profile
You can find the list of profiles at `/usr/share/archiso/configs/`.
It contains two profiles.
But, what is a profile?

A profile contains folders and files and files instructing what to install with the live system, and what to put on the ISO root file system.
Default profiles are either `baseline` (the *almost* bare ISO which is about half the size of the usual), and `releng` (official ISOs).

If you don't want deal with a huge mess, then I **highly** recommend that you go with the `releng` profile.
The `baseline` profile is missing some key things compared to `releng` (editors, populated pacman-keys, etc.) that makes it easy to install.

If you want to modify the profile, then recursively copy the profile of your choice to somewhere persistent.

`$ cp -r /usr/share/archiso/config/releng ~/customProfile`[^consistent_reference]

`$ cd ~/customProfile`

When you finish copying, you can go into that directory.

The profiles contains files and folders.
Here's a list[^profile_ls] of them with explanation:
- airootfs/
    - This folder is the root filesystem for the ISO.
- efiboot/
    - This contains files and folders to direct the EFI to boot arch linux.
- syslinux/
    - Same as efiboot, but for BIOS.
- packages.x86_64
    - This file contains a list of packages that is told to be installed to the ISO.
    - The ISO builder will ignore anything that starts with a `#`.
    - This will not assist in offline installation.
- pacman.conf
    - This is the pacman configuration for downloading the specified packages from packages.x86_64
    - The ISO builder will ignore anything that starts with a `#`.
    - This will not assist in offline installation.
- profiledef.sh
    - This sets a few metadata about the ISO.
        - The mentioned metadata contains the ISO name, the label, the publisher, application, and version.


## Downloading the Packages for Offline Installation[^offline]
To download packages for offline installation, cd into `airootfs/root`, and create any folder, preferably called `.packages` and cd into it.

```sh
$ cd airootfs/root
# mkdir .packages
# cd .packages
```

Now, you must also create a folder in the temporary directory.

`$ mkdir /tmp/blankdb`

The folder just created is used to install dependencies of the packages you will choose to install, so dependencies don't rely on your arch system, which won't be carried over to the ISO.

To download the wanted packages, you paste the command below and add package names to the end.

`# pacman -Syw --cachedir . --dbpath /tmp/blankdb `

If you want to install the `vlc` package, then you can add `vlc` to the list of packages to install like:

`# pacman -Syw --cachedir . --dbpath /tmp/blankdb vlc`

You can always add more packages to the list of arguments, and after you already downloaded the chosen packages.
But after downloading everything you want[^every_package], you should add the packages to a database file to be used by pacman:

`# repo-add ./custom.db.tar.gz ./*`

What the command does is add entries to a database file, so it knows where to get the packages and if the package wasn't modified.

Changing `./custom.db.tar.gz` to `./offline.db.tar.gz` can affect how pacman sees packages[^unconfirmed].

Congratulations! You've downloaded packages and made a repository.
Now, pacman won't use this unless you add to the repositories in `/etc/pacman.conf`.

Now open your favorite editor on `airootfs/etc/pacman.conf` (if it doesn't exist, copy pacman.conf from the profile root), and find the first repository (most likely core, or testing).

Above the first repository that's enabled, place this bit of text[^repository_name]:

```
[custom]
SigLevel = PackageRequired
Server = file:///root/.packages
```

You can also change the server to `file:///mnt/.packages`, meaning you would have to mount from either USB or CD/DVD.

Congratulations! You've downloaded and configured the Live-CD pacman to use the offline packages.

## Building the ISO
If you messed around `airootfs` and make some scripts that may help during the install (like I did), a few other files, and decided you're finished, then you can run the following command to build the ISO (assuming you're outside of the profile folder):

`# mkarchiso -v -o ./ ./customProfile`

What the command will do is call `mkarchiso`, used to make ISOs.
To explain what the arguments mean, `-v` means verbose mode, giving you the stuff it's doing (empty is not interesting and unhelpful).
`-o ./` means set the output to the current directory, outputting the built ISO at the current directory.
`./customProfile` references the custom built profile, and will affect how the ISO is built (packages list, included files, etc.).

Now, when you execute the command, it will start building the ISO.
It will take a while (about 30 minutes on virtualbox with 2 processors for me), but the output file should be called `archlinux-YYYY.MM.DD-${architecture}.iso`[^architecture]

After it's done building, you can now test the custom ISO with `$ run_archiso -i /path/to/archlinux-yyyy.mm.dd-x86_64.iso`[^run_archiso], or just throw the ISO onto a CD/DVD/USB/[VentoyUSB](https://www.ventoy.net/en/index.html).

## Conclusion
In this post, you learned how to download packages, and build an Arch Linux ISO out of it.
If you have encountered any issues, please contact me on [twitter][twitter_contact] or try to read the wiki.

## Footnotes
[^profile_ls]: The list is taken from [this readme](https://gitlab.archlinux.org/archlinux/archiso/-/blob/master/README.profile.rst), and may not contain up-to-date/correct information. Plus, a few were modified to be more accurate (if it is).
[^consistent_reference]: I will be assuming you were following the exact commands, so you might have to change a few command arguments if you did change any. If the command prefix is `#`, execute as root/use sudo. If the command prefix is `$`, then you can execute as yourself or root.
[^offline]: Commands were taken from [this page of the wiki](https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Installing_packages_from_a_CD/DVD_or_USB_stick).
[^unconfirmed]: I cannot confirm if the statement is true or false. If you do encounter any issues, please contact me on [twitter][twitter_contact].
[^every_package]: Everything is not limited to things you can download from pacman. The custom repository can also include [AUR packages](https://wiki.archlinux.org/index.php/Arch_User_Repository) (AUR packages are not built on install. They must be built during the making of the custom repository.)
[^repository_name]: The `[custom]` is dependent on which database you chose when executing the `repo-add`.
[^architecture]: The architecture of the system you built it on. As of 2021, it is most likely x86_64.
[^run_archiso]: This is assuming [QEMU](https://archlinux.org/packages/?name=qemu) and [edk2-ovmf](https://archlinux.org/packages/?name=edk2-ovmf) is installed, and QEMU works.
[twitter_contact]: https://twitter.com/messages/compose?recipient_id=909886275741679616