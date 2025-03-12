## About

The sourcezap utility manages a local copy of the
[HardenedBSD source tree](https://git.HardenedBSD.org/HardenedBSD/HardenedBSD).
The copy of the source tree is maintained by members of
the `_sourcezap` group, and the copy of the source tree
can be installed into /usr/src/ by root.

Certain sourcezap commands are restricted to members of the
`_sourcezap` group, while others require superuser privileges.
Group commands are delegated to the `_sourcezap` user via the
[doas(1)](https://man.openbsd.org/doas) utility instead of
being run by the user running a given command.

## CLI

#### Group

The following commands are restricted to members
of the `_sourcezap` group, and delegated to the
`_sourcezap` user via [doas(1)](https://man.openbsd.org/doas).
The configuration and initial setup of [doas(1)](https://man.openbsd.org/doas)
and /home/_sourcezap is automated via the `sourcezap setup`
command. See the [Install](#install) section for more details:

* sourcezap clone <br>
Clone the HardenedBSD source tree into /home/_sourcezap/src/ <br>

* sourcezap pull <br>
Pull updates into /home/_sourcezap/src/ <br>

* sourcezap sh <br>
Run /bin/sh within /home/_sourcezap/src/ <br>

#### Superuser

The following commands are restricted to root, or user id 0. <br>
Permission to run the following commands is denied for any other user:

* sourcezap rm <br>
Remove the contents of /usr/src/ and /home/_sourcezap/src/ <br>

* sourcezap install <br>
Install /home/_sourcezap/src/ into /usr/src/ <br>

## Install

#### Package

sourcezap is available
[from the HardenedBSD src tree](https://git.HardenedBSD.org/HardenedBSD/ports/-/tree/HardenedBSD/main/hardenedbsd/sourcezap).
<br>
"pkg install sourcezap" should work too but expect slower updates.

#### Source

The first step is to clone the repository. <br>
Afterwards sourcezap can be installed (and deinstalled) through make:

```sh
git clone https://github.com/0x1eef/sourcezap
cd sourcezap
doas -u root -- make install
doas -u root -- make deinstall
```

#### Configuration

After installation is complete the sourcezap environment should be setup.
That involves the creation of the `_sourcezap` user and group, as well as
the creation of /home/\_sourcezap. A user should also be added to the
`_sourcezap` group. The process is mostly automated:

```sh
doas -u root -- sourcezap setup
doas -u root -- pw groupmod _sourcezap -m <user> # Add group member
doas -u root -- sourcezap teardown               # Optional - reverse 'sourcezap setup'
```

## Environment

* __$SOURCEZAP\_CLONEURL__ <br>
  The URL of a git repository  <br>
  Default: https://github.com/HardenedBSD/HardenedBSD.git

* __$SOURCEZAP\_INSTALLDIR__ <br>
  The directory where the source tree will be installed <br>
  Default: /usr/src/

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
