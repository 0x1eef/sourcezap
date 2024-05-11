## About

srczap manages a local copy of the
[HardenedBSD source tree](https://git.HardenedBSD.org/HardenedBSD/HardenedBSD).
The copy of the source tree is maintained by members of
the `_srczap` group, and a copy of the source tree
can be installed into `/usr/src/` by root.

## Examples

### CLI: setup-srczap

This command should be run after installing srczap for
the first time:

    # Add the '_srczap' user, group and home directory
    # This command requires root privileges
    # setup-sourcezap

### CLI: sourcezap

    # Clone the HardenedBSD source tree into /home/_sourcezap/src/
    # This command is delegated to the '_sourcezap' user
    $ sourcezap clone

    # Pull updates into /home/_sourcezap/src/
    # This command is delegated to the '_sourcezap' user
    $ sourcezap pull

    # Install /home/_sourcezap/src/ into /usr/src/
    # This command requires root privileges
    # sourcezap install

    # Start over: erase /usr/src/ and /home/_sourcezap/src/
    # This command requires root privileges
    $ sourcezap erase


### ENVIRONMENT

* __$SOURCEZAP\_GITURL__ <br>
  The URL to a git repository.  <br>
  Default: https://git.HardenedBSD.org/HardenedBSD/HardenedBSD.git.

* __$SOURCEZAP\_BRANCH__ <br>
  The git branch to clone and pull updates from. <br>
  Default: hardened/14-stable/master.

* __$SOURCEZAP\_INSTALLDIR__ <br>
  The directory where the source tree will be installed. <br>
  Default: /usr/src/.

## Install

**Source**

The most recent version of sourcezap can be installed directly
via git:

    $ git clone https://github.com/0x1eef/sourcezap.git
    $ cd sourcezap
    # make install
    # setup-sourcezap
    # pw groupmod -n _sourcezap -m <user>

## Requirements

* [doas](https://man.openbsd.org/doas) (`pkg install doas`)
* [git](https://www.man7.org/linux/man-pages/man1/git.1.html) (`pkg install git`)

## Sources

* [GitHub](https://github.com/0x1eef/sourcezap)
* [GitLab](https://gitlab.com/0x1eef/sourcezap)
* [git.HardenedBSD.org](https://git.HardenedBSD.org/0x1eef/sourcezap)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/). <br>
See [LICENSE](./LICENSE).
