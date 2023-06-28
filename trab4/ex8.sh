#!/bin/bash
find $1 -maxdepth 1 -iname '*.mpeg' -exec bash -c 'mv ${0} "${0%.mpeg}.mp3"' {} \;