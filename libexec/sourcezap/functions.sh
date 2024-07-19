#!/bin/sh

git()
{
    "${libexec}"/utils/git/run "${@}"
}

printok()
{
    printf "ok: %s\n" "${msg}" > /dev/stdout
}

printerr()
{
    printf "error: %s\n" "${err}" > /dev/stderr
}
