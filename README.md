## About

The sourcezap utility manages a local copy of the
[HardenedBSD source tree](https://git.HardenedBSD.org/HardenedBSD/HardenedBSD).
The copy of the source tree is maintained by members of
the `_sourcezap` group, and the copy of the source tree
can be installed into /usr/src/ by root.

## Roles

#### User

The following commands are restricted to members of the `_sourcezap` group. <br>
The commands are delegated to the
`_sourcezap` user via the [mdo(1)](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1)
command:

* sourcezap clone <br>
Clone the HardenedBSD source tree into `/home/_sourcezap/src/` <br>

* sourcezap pull <br>
Pull updates into `/home/_sourcezap/src/` <br>

* sourcezap sh <br>
Run /bin/sh within `/home/_sourcezap/src/` <br>

#### Superuser

The following commands are restricted to root, or user id 0. <br>
Permission to run the following commands is denied for any other user:

* sourcezap rm <br>
Remove the contents of `/usr/src/` and `/home/_sourcezap/src/` <br>

* sourcezap install <br>
Install `/home/_sourcezap/src/` into `/usr/src/` <br>

* sourcezap apply <br>
Apply security.mac.do.rules for sourcezap <br>
Typically called from `/etc/rc.local` at boot time <br>

## Configuration

#### Superuser

After installation is complete the sourcezap environment should be setup.

That includes the creation of the `_sourcezap` user and group, as well as
the creation of `/home/_sourcezap`. A user should also be added to the
`_sourcezap` group. The process is mostly automated, and the following
commands should be run as a superuser:

* sourcezap setup <br>
Creates the `_sourcezap` user and group <br>

* sourcezap teardown <br>
Tears down the `_sourcezap` user and group <br>

* pw groupmod _sourcezap -m `<user>` <br>
Add a user to the `_sourcezap` group. <br>

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
* [hardenedbsd.org/@0x1eef](https://git.HardenedBSD.org/0x1eef/sourcezap)
* [bsd.cafe/@0x1eef](https://brew.bsd.cafe/0x1eef/sourcezap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./LICENSE)
