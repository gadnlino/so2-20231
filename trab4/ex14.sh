#!/bin/bash
i=1
while [ "$#" -gt 0 ] ; do
    printf "%d: %s\n" "$i" "$1"
    shift
    i=$(($i+1))
done