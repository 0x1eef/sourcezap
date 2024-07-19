#!/bin/sh

git()
{
    "${libexec}"/utils/git/run "${@}"
}

printok()
{
    "${libexec}"/utils/printok "${@}"
}

printerr()
{
    "${libexec}"/utils/printerr "${@}"
}
