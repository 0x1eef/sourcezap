## About

sourcezap manages a local copy of the
[HardenedBSD source tree](https://git.HardenedBSD.org/HardenedBSD/HardenedBSD).
The copy of the source tree is maintained by members of
the `_sourcezap` group, and a copy of the source tree
can be installed into `/usr/src/` by root.

## Examples

### CLI: setup-sourcezap

This command should be run after installing sourcezap for
the first time:

    # Add the '_sourcezap' user, group and home directory
    # This command requires root privileges
    # setup-sourcezap

### CLI: sourcezap

    # Clone the HardenedBSD source tree into /home/_sourcezap/src/
    # This command is delegated to the '_sourcezap' user
    $ sourcezap clone

    # Pull updates into /home/_sourcezap/src/
    # This command is delegated to the '_sourcezap' user
    $ sourcezap pull

    # Checkout a branch other than the default: hardened/14-stable/master
    # This command is delegated to the '_sourcezap' user
    $ sourcezap checkout hardened/13-stable/master

    # Install /home/_sourcezap/src/ into /usr/src/
    # This command requires root privileges
    # sourcezap install

    # Start over: erase /usr/src/ and /home/_sourcezap/src/
    # This command requires root privileges
    $ sourcezap erase


### ENVIRONMENT

* __$SOURCEZAP\_CLONEURL__ <br>
  The URL to a git repository.  <br>
  Default: https://git.HardenedBSD.org/HardenedBSD/HardenedBSD.git.

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
