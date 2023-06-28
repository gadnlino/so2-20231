#!/bin/bash
diretorio_a_compactar=$1
diretorio_destino=$2

if [ ! -d $diretorio_a_compactar ]; then
    echo 'O diretório a compactar informado não existe'
    exit 1
fi

if [ ! -d $diretorio_destino ]; then
    echo 'O diretório destino não existe'
    exit 1
fi

cd $diretorio_a_compactar

tar -czf $diretorio_destino/BKP-`date +%Y-%m-%d`.tar.gz .