#!/bin/sh

git()
{
    "${libexec}"/utils/git/run "${@}"
}

printok()
{
    printf "ok: %s\n" "${@}" > /dev/stdout
}

printerr()
{
    printf "error: %s\n" "${@}" > /dev/stderr
}
