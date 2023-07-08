#!/bin/bash
echo 'Qual o diretório desejado? '; read diretorio
echo 'Qual a extensão que deseja buscar? '; read extensao_1
echo 'Qual a nova extensão? '; read extensao_2
find $diretorio -maxdepth 1 -iname "*.$extensao_1" -exec bash -c "mv \${0} \"\${0%.$extensao_1}.$extensao_2\"" {} \;