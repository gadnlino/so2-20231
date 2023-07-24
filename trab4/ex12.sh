#!/bin/bash
arquivo=$*
echo "Número de linhas: $(cat $arquivo | wc -l)"

echo "Número de palavras: $(cat $arquivo | wc -w)"
