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
`_sourcezap` user via the [doas(1)](https://man.openbsd.org/doas) command:

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

## Configuration

#### Superuser

After installation is complete the sourcezap environment should be setup.

That includes the creation of the `_sourcezap` user and group, as well as
the creation of `/home/_sourcezap`. A user should also be added to the
`_sourcezap` group. The process is mostly automated, and the following
commands should be run as a superuser:

* sourcezap setup <br>
Creates the `_sourcezap` user and group, and the `/home/_sourcezap` directory <br>

* sourcezap teardown <br>
Tears down the `_sourcezap` user and group, and removes the `/home/_sourcezap` directory <br>

* pw groupmod _sourcezap -m `<user>` <br>
Add a user to the `_sourcezap` group. <br>

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
