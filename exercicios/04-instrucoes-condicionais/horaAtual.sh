#!/bin/bash

#####################################################################################
#                                                                                   #
# horaAtual.sh                                                                      #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 03/04/2018                                                          #
#                                                                                   #
# Descrição: Gera saudação (bom dia, boa tarde e boa noite) de acordo com           #
#            a hora atual.                                                          #
#                                                                                   #
# Exemplo de uso: ./horaAtual.sh                                                    #
#                                                                                   #
#####################################################################################

clear
HORA=$(date +%H)
#HORA=$1

if [ $HORA -ge 6 -a $HORA -lt 12 ]
then
	echo "Bom dia!"
elif [ $HORA -ge 12 -a $HORA -lt 18 ]
then
	echo "Boa tarde!"
else
	echo "Boa noite!"
fi

echo

if [ $HORA -ge 12 ]
then
	AMPM=PM
else
	AMPM=AM
fi

HORA_ATUAL=$(date +%r)
echo "A hora atual é: $HORA_ATUAL $AMPM"
