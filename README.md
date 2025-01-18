## About

sourcezap is a utility that manages a local copy of the
[HardenedBSD source tree](https://git.HardenedBSD.org/HardenedBSD/HardenedBSD).
The copy of the source tree is maintained by members of
the `_sourcezap` group, and the copy of the source tree
can be installed into `/usr/src/` by root.

sourcezap separates commands according to the role of a user. Certain
commands can only be run by members of the `_sourcezap` group, and
certain commands can only be run by a superuser (eg root). Group commands
are delegated to the `_sourcezap` user rather than being run as the
user invoking a given command.

## CLI

#### Group

The following commands are restricted to members
of the `_sourcezap` group, and delegated to the
`_sourcezap` user via [doas(1)](https://man.openbsd.org/doas).
The configuration and initial setup of [doas(1)](https://man.openbsd.org/doas)
and `/home/_sourcezap` is automated via the `sourcezap setup`
command. See the [Install](#install) section for more details:

* sourcezap clone <br>
Clone the HardenedBSD source tree into `/home/_sourcezap/src/` <br>

* sourcezap pull <br>
Pull updates into `/home/_sourcezap/src/` <br>

* sourcezap sh <br>
Run `/bin/sh` within `/home/_sourcezap/src/` <br>

#### Superuser

The following commands are restricted to root, or user id 0. <br>
Permission to run the following commands is denied for any other user:

* sourcezap rm <br>
Remove the contents of `/usr/src/` and `/home/_sourcezap/src/` <br>

* sourcezap install <br>
Install `/home/_sourcezap/src/` into `/usr/src/` <br>

## Environment

* __$SOURCEZAP\_CLONEURL__ <br>
  The URL of a git repository  <br>
  Default: https://github.com/HardenedBSD/HardenedBSD.git

* __$SOURCEZAP\_INSTALLDIR__ <br>
  The directory where the source tree will be installed <br>
  Default: /usr/src/

## Install

sourcezap is available
[from the HardenedBSD ports tree](https://git.HardenedBSD.org/HardenedBSD/ports/-/tree/HardenedBSD/main/hardenedbsd/sourcezap).
`pkg install sourcezap` should work too but expect slower updates. After installation
of sourcezap, `sourcezap setup` should be run as root and one or more users should
be added to the `_sourcezap` group:

    root@localhost# sourcezap setup
    root@localhost# pw groupmod -n _sourcezap -m myuser

## Requirements

* [doas](https://man.openbsd.org/doas)
* [git](https://www.man7.org/linux/man-pages/man1/git.1.html)

## Sources

* [github.com/@0x1eef](https://github.com/0x1eef/sourcezap)
* [gitlab.com/@0x1eef](https://gitlab.com/0x1eef/sourcezap)
* [hardenedbsd.org/@0x1eef](https://git.HardenedBSD.org/0x1eef/sourcezap)
* [bsd.cafe/@0x1eef](https://brew.bsd.cafe/0x1eef/sourcezap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./LICENSE)
