#!/bin/sh

printok()
{
    printf "sourcezap: %s\n" "${1}" > /dev/stdout
}

printerr()
{
    printf "sourcezap: %s\n" "${1}" > /dev/stderr
}
