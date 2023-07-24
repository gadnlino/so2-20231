#!/bin/bash
if [ -f "$1" ] ; then
    echo "O arquivo '$1' existe."
else
    echo "O arquivo '$1' não existe ou você não tem permissão de acesso a ele."
fi
