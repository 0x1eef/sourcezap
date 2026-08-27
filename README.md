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
`_sourcezap` user, so git never runs with elevated privileges.

The default source tree is HardenedBSD, but sourcezap works with any
git URL. The same workflow can manage the
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

### Setup

<details>
<summary>First-time setup</summary>
<br>

The mac_do(4) policy must be loaded before sourcezap can use
mdo(1). Add it to `/boot/loader.conf` and reboot, or load it
manually without a reboot:

```sh
##
# Permanent
sysrc -f /boot/loader.conf mac_do_load="YES"

##
# Temporary (no reboot)
kldload mac_do
```

Then create the `_sourcezap` user and group:

```sh
sourcezap setup
```

Run `sourcezap teardown` later to reverse this step. Both commands
require root.

Add yourself to the `_sourcezap` group only if you want to run
`clone`, `pull`, or `sh` without root. When those commands are run
as root, sourcezap drops privileges to `_sourcezap` automatically:

```sh
pw groupmod _sourcezap -m <user>
```

Enable and start the rc.d service that applies the mac_do(4) rules:

```sh
sysrc sourcezap_enable="YES"
service sourcezap start
```

</details>

### Commands

All `sourcezap` commands can be run as root. The commands that touch
the git source tree (`clone`, `pull`, and `sh`) are delegated to the
`_sourcezap` user through
[mdo(1)](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1), so
root drops privileges before running anything inside
`/home/_sourcezap/src/`. Members of the `_sourcezap` group can run
the same delegated commands without root. Everything else is root-only,
except `status`, which any user can run.

#### Delegated

<details>
<summary>clone</summary>
<br>

Clone the source tree into `/home/_sourcezap/src/` as the `_sourcezap`
user. The repository URL comes from `SOURCEZAP_CLONEURL`, which
defaults to the official HardenedBSD radicle repository.

```sh
sourcezap clone
```

</details>

<details>
<summary>pull</summary>
<br>

Pull updates into `/home/_sourcezap/src/` as the `_sourcezap` user.
The current branch is pulled from its upstream remote without
rebasing.

```sh
sourcezap pull
```

</details>

<details>
<summary>sh</summary>
<br>

Run `/bin/sh` inside `/home/_sourcezap/src/` as the `_sourcezap` user.
Use this instead of editing or running git commands in the source tree
as root.

```sh
sourcezap sh
```

</details>

#### Root-only

<details>
<summary>install</summary>
<br>

Install `/home/_sourcezap/src/` into `/usr/src/` with rsync. The
install is skipped when `/usr/src/` already matches the current
source commit; pass `-f` to force it.

```sh
sourcezap install
sourcezap install -f
```

</details>

<details>
<summary>rm</summary>
<br>

Interactively remove the contents of `/usr/src/` and/or
`/home/_sourcezap/src/`. This command requires root.

```sh
sourcezap rm
```

</details>

<details>
<summary>apply / unapply</summary>
<br>

Apply or remove the sourcezap
[mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
rules. Both commands require root.

```sh
sourcezap apply
sourcezap unapply
```

</details>

#### Anyone

<details>
<summary>status</summary>
<br>

Show whether the sourcezap
[mac_do(4)](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
rules are applied. This command can be run by any user.

```sh
sourcezap status
```

</details>

#### FreeBSD

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

## Configuration

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

## Requirements

* [mdo](https://man.freebsd.org/cgi/man.cgi?query=mdo&sektion=1)
* [mac_do](https://man.freebsd.org/cgi/man.cgi?query=mac_do&sektion=4)
* [git](https://git-scm.com/)
* [rsync](https://rsync.samba.org/)

## License

[BSD Zero Clause](https://choosealicense.com/licenses/0bsd/) <br>
See [LICENSE](./LICENSE)
