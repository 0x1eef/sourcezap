## About

The sourcezap utility manages a local copy of the
[hardenedBSD source tree](https://git.hardenedBSD.org/hardenedBSD/hardenedBSD)
in a way that is efficient, scalable, and secure. The
utility provides consistent ownership and permissions
for the source tree, maintains a clean separation between
root-only operations and unprivileged operations, and
offers a simple workflow for updating and installing
the source tree.

## Features

* Easy to use.
* A simple workflow: clone, pull, then install.
* Uses `rsync` and `git` for fast, efficient updates.
* Restricts access to root and `_sourcezap` group members.
* Separates unprivileged operations from root-only operations.
* One dedicated user (`_sourcezap`) for managing the source tree.
* Keeps ownership and permissions consistent in `/home/_sourcezap/src/` and `/usr/src/`.
* Delegation: [mdo(1)](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1) runs commands as `_sourcezap`.
* Clear permissions: [mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4) rules decide who can act as `_sourcezap`.

## Commands

#### User

The following commands are delegated to the `_sourcezap` user and
authorized by [mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4) rules. By default you must be root or a
member of the `_sourcezap` group to run the following commands:

* sourcezap auth <br>
Run `rad auth` as `_sourcezap` <br>

* sourcezap start-node <br>
Run `rad node start` as `_sourcezap` <br>

* sourcezap clone <br>
Clone the hardenedBSD source tree into `/home/_sourcezap/src/` <br>

* sourcezap pull <br>
Pull updates into `/home/_sourcezap/src/` <br>

* sourcezap sh <br>
Run /bin/sh within `/home/_sourcezap/src/` <br>

* sourcezap status <br>
Show whether [mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4) rules are applied <br>

#### Superuser

The following commands are restricted to root, or user id 0. <br>
Permission to run the following commands is denied for any other user:

* sourcezap rm <br>
Remove the contents of `/usr/src/` and `/home/_sourcezap/src/` <br>

* sourcezap install <br>
Install `/home/_sourcezap/src/` into `/usr/src/` <br>

* sourcezap apply <br>
Apply [mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4) rules <br>
Allows root and members of the `_sourcezap` group to act as the `_sourcezap` user <br>

* sourcezap unapply <br>
Remove [mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4) rules <br>

## Setup

#### mac_do(4)

The
[mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
policy must be loaded into the kernel before sourcezap(1)
can use the
[mdo(1)](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1)
utility successfully. This can be done in one of two ways, _the
recommended way_ is to add the following line to `/boot/loader.conf`:

    mac_do_load="YES"

And then reboot the system. Otherwise, the policy can be loaded manually
with the following command and without a reboot:

    root@localhost# kldload mac_do

#### Environment

After installation is complete the sourcezap environment should be setup.

That includes the creation of the `_sourcezap` user and group, as well as
the creation of `/home/_sourcezap`. Adding a user to the `_sourcezap` group is
recommended when you want to manage the tree as a non-root user (who will
then be delegated to `_sourcezap`). The process is mostly automated, and the
following commands should be run as a superuser:

* sourcezap setup <br>
Creates the `_sourcezap` user and group <br>

* sourcezap teardown <br>
Tears down the `_sourcezap` user and group <br>

* pw groupmod _sourcezap -m `<user>` <br>
Add a user to the `_sourcezap` group. <br>

#### rc.d

The rc.d script that manages the [mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4) rules should also be enabled:

    sysrc sourcezap_enable="YES"

And then the service should be started:

    service sourcezap start


## Install

#### Package

sourcezap is available
[from the hardenedBSD src tree](https://git.hardenedBSD.org/hardenedBSD/ports/-/tree/hardenedBSD/main/hardenedBSD/sourcezap).
<br>
"pkg install sourcezap" should work too but expect slower updates.

#### Source

The first step is to clone the repository. <br>
Afterwards sourcezap can be installed (and deinstalled) through make:

```sh
git clone https://github.com/0x1eef/sourcezap
cd sourcezap
make install
make deinstall
```

## Requirements

* [mdo](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1)
* [mac_do](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
* [git](https://www.man7.org/linux/man-pages/man1/git.1.html)
* [rsync](https://www.man7.org/linux/man-pages/man1/rsync.1.html)

## Sources

* [github.com/@0x1eef](https://github.com/0x1eef/sourcezap)
* [gitlab.com/@0x1eef](https://gitlab.com/0x1eef/sourcezap)
* [hardenedBSD.org/@0x1eef](https://git.hardenedBSD.org/0x1eef/sourcezap)
* [bsd.cafe/@0x1eef](https://brew.bsd.cafe/0x1eef/sourcezap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./LICENSE)
