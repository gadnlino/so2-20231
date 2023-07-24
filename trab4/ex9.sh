#!/bin/bash
echo 'Qual o diretório desejado? '; read diretorio
find $diretorio -maxdepth 1 -iname '*.mpeg' -exec bash -c 'mv ${0} "${0%.mpeg}.mp3"' {} \;
