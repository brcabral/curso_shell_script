#!/bin/bash

#####################################################################################
#                                                                                   #
# monitoraProcesso.sh                                                               #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 20/04/2018                                                          #
#                                                                                   #
# Descrição: Script recebe o nome de um processo e verifica se o mesmo está         #
#            sendo executado (o script deve ficar em execução constante).           #
#                                                                                   #
# Exemplo de uso: ./monitoraProcesso.sh firefox &                                   #
#                                                                                   #
#####################################################################################

clear

TIME=3

if [ -z $1 ]
then
	echo "O nome do processo não foi informado"
	echo "/.monitoraProcesso.sh <processo>"
	exit 1
fi

while true
do
	# elimina do retorno o processo do grep (-v grep) e o processo do script (-v $0)
	# $0 - nome do script
	if ps axu | grep $1 | grep -v grep | grep -v $0 > /dev/null
	then
		sleep $TIME
	else
		echo "ATENÇÃO!!!!!!! O processo $1 NÃO está em execução!"
		sleep $TIME
	fi
done
