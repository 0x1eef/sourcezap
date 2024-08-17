## About

sourcezap is a utility that manages a local copy of the
[HardenedBSD source tree](https://git.HardenedBSD.org/HardenedBSD/HardenedBSD).
The copy of the source tree is maintained by members of
the `_sourcezap` group, and the copy of the source tree
can be installed into `/usr/src/` by root.

## CLI

### CLI: setup

`sourcezap setup` should be run after installing sourcezap for
the first time. <br> There is no harm in running `sourcezap setup`
multiple times:

    # Add the '_sourcezap' user, group and home directory
    # This command requires root privileges
    root@localhost# sourcezap setup

    # Reverse the changes made by 'sourcezap setup'
    # This command requires root privileges
    root@localhost# sourcezap teardown

### CLI: group

The following commands are delegated to the `_sourcezap` user and
restricted to members of the `_sourcezap` group. The restrictions
are enforced by sourcezap and to a lesser extent by
[doas(1)](https://man.openbsd.org/doas):

* **sourcezap clone** <br>
Clone the HardenedBSD source tree into `/home/_sourcezap/src/` <br>

* **sourcezap pull** <br>
Pull updates into `/home/_sourcezap/src/` <br>

* **sourcezap checkout** <br>
Checkout a branch other than the default: `hardened/14-stable/master` <br>

* **sourcezap sh** <br>
Run `/bin/sh` within `/home/_sourcezap/src/` <br>

### CLI: superuser

The following commands are restricted to root. <br>
The restrictions are enforced by sourcezap:

* **sourcezap rm** <br>
Remove the contents of `/usr/src/` and `/home/_sourcezap/src/` <br>

* **sourcezap install** <br>
Install `/home/_sourcezap/src/` into `/usr/src/` <br>

## Environment

* __$SOURCEZAP\_CLONEURL__ <br>
  The URL of a git repository  <br>
  Default: https://git.HardenedBSD.org/HardenedBSD/HardenedBSD.git

* __$SOURCEZAP\_INSTALLDIR__ <br>
  The directory where the source tree will be installed <br>
  Default: /usr/src/

## Install

sourcezap is available
[from the HardenedBSD ports tree](https://git.HardenedBSD.org/HardenedBSD/ports/-/tree/HardenedBSD/main/hardenedbsd/sourcezap).
`pkg install sourcezap` should work too but expect slower updates. The most
recent version of sourcezap can be installed via git:

    # Clone
    user@localhost$ git clone https://git.hardenedbsd.org/0x1eef/sourcezap.git
    user@localhost$ cd sourcezap

    # Install
    root@localhost# make install
    root@localhost# sourcezap setup

    # Add user to '_sourcezap' group
    root@localhost# pw groupmod -n _sourcezap -m <user>

## Requirements

* [doas](https://man.openbsd.org/doas)
* [git](https://www.man7.org/linux/man-pages/man1/git.1.html)

## Sources

* [GitHub](https://github.com/0x1eef/sourcezap)
* [GitLab](https://gitlab.com/0x1eef/sourcezap)
* [git.HardenedBSD.org/@0x1eef](https://git.HardenedBSD.org/0x1eef/sourcezap)
* [brew.bsd.cafe/@0x1eef](https://brew.bsd.cafe/0x1eef/sourcezap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./LICENSE)
