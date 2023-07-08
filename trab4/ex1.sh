#!/bin/bash
#variáveis de ambiente
echo $PATH
echo $USER $HOME
# Pode-se ver todas as variáveis de ambiente com o comando env | less
# Variaveis locais
echo "$ola Joao"
echo "$olaJoao"
echo "${ola} Joao"
msg="$ola $USER"
echo msg
#input
echo "Escreva qualquer coisa"; read var
echo "Escreveu $var"
#execução
data=`date`
echo $data
info=`echo $HOME ; echo " estamos em "; pwd`
echo $info
#contas
x=1
let x=x+2+3
echo "x=$x"
x=$((x+3))
echo "x=$x"
let x--
echo "x=$x"
#variáveis especiais
echo "Numero de argumentos para este script $#"
echo "Numero de argumentos para este script $*"
echo "Primeiro argumento $1 Segundo argumento $2"
echo "Nome deste script $0"
echo "O process ID deste script $$"
echo "Exit status do comando anterior $?"