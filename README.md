<p align="center">
  <a href="https://4.4bsd.dev">
    <img
      src="44bsd.svg"
      width="400"
      height="200"
      border="0"
      alt="a 4.4bsd.dev project"
     >
  </a>
</p>

> [4.4BSD](https://4.4bsd.dev) project.

sourcezap manages a local copy of the BSD source tree in a way that is
efficient, scalable, and secure. It provides consistent ownership and
permissions for the source tree, keeps a clean separation between
root-only operations and unprivileged operations, and offers a simple
clone, pull, and install workflow.

Every `sourcezap` command can be run as root. For the commands that
touch the git source tree, sourcezap drops privileges to the dedicated
`_sourcezap` user, so git never runs with elevated privileges. The default
source tree is HardenedBSD, but sourcezap works with any git URL. The same
workflow can manage the
[FreeBSD source tree](https://git.FreeBSD.org/src.git) by setting
`SOURCEZAP_CLONEURL`.

## Install

#### pkg(8)

`pkg install sourcezap` works on HardenedBSD.
<br>
sourcezap is also available from
[the HardenedBSD ports tree](https://git.hardenedBSD.org/hardenedBSD/ports/-/tree/hardenedBSD/main/hardenedBSD/sourcezap).

#### git(1)

The first step is to clone the repository. <br>
Afterwards sourcezap can be installed (and deinstalled) through make:

```sh
git clone https://github.com/4-4BSD/sourcezap
cd sourcezap
make install
make deinstall
```

## Quick start

Run as root. <br>
Delegate to the `_sourcezap` user.

    ##
    # Run once
    root@localhost# sysrc -f /boot/loader.conf mac_do_load="YES"
    root@localhost# sysrc sourcezap_enable="YES"
    root@localhost# kldload mac_do
    root@localhost# sourcezap setup
    root@localhost# service sourcezap start

    ##
    # Everyday usage
    # All commands run as _sourcezap
    root@localhost# sourcezap clone
    root@localhost# sourcezap install
    root@localhost# sourcezap pull

    ##
    # Drop into a shell
    # Run as the _sourcezap user
    root@localhost# sourcezap sh

## Tunables

<details>
<summary>SOURCEZAP_CLONEURL</summary>
<br>

The git repository URL cloned by `sourcezap clone`.

Default:

```
https://rad.hardenedbsd.org/z2HLHXgL1xevBNQsf8BmQW7MpJmtm.git
```

</details>

<details>
<summary>SOURCEZAP_INSTALLDIR</summary>
<br>

The directory where the source tree is installed by
`sourcezap install`.

Default:

```
/usr/src
```

</details>

<details>
<summary>mac_do(4)</summary>
<br>

The
[mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
policy must be loaded into the kernel before sourcezap can use
[mdo(1)](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1).
Add it to `/boot/loader.conf` and reboot:

```
mac_do_load="YES"
```

Or load it manually without a reboot:

```
kldload mac_do
```

</details>

<details>
<summary>rc.d</summary>
<br>

The rc.d script manages the sourcezap
[mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
rules:

```sh
sysrc sourcezap_enable="YES"
service sourcezap start
```

</details>

<details>
<summary>Managing a different source tree</summary>
<br>

sourcezap is not limited to HardenedBSD. Set `SOURCEZAP_CLONEURL` to
any git repository before running `sourcezap clone`, and the same
clone, pull, and install workflow applies. Run the commands as root:
`clone` and `pull` drop privileges to `_sourcezap`, while `install`
stays root-only. For example, to manage the FreeBSD source tree:

```sh
export SOURCEZAP_CLONEURL=https://git.FreeBSD.org/src.git
sourcezap clone
sourcezap pull
sourcezap install
```

The GitHub mirror works too:

```sh
export SOURCEZAP_CLONEURL=https://github.com/freebsd/freebsd-src.git
sourcezap clone
```

When the HardenedBSD-specific branch is not present in the configured
repository, sourcezap falls back to the repository's default branch.

</details>

## Requirements

* [mdo](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1)
* [mac_do](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
* [git](https://git-scm.com/)
* [rsync](https://rsync.samba.org/)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./LICENSE)
