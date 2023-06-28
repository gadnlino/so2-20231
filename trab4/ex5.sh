#!/bin/bash
if stat $1 >/dev/null 2>/dev/null; then
    tamanho_arquivo_bytes=$(stat -c %s $1)
    if [ $tamanho_arquivo_bytes -gt 100 ]; then
        echo 'O tamanho do arquivo é maior que 100 bytes.'
    else
        echo 'O tamanho do arquivo é menor ou igual a 100 bytes.'
    fi
else
    echo 'O arquivo não existe ou você não tem permissão para vê-lo.'
fi