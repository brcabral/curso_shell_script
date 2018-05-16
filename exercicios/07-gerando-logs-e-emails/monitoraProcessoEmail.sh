#!/bin/bash

#####################################################################################
#                                                                                   #
# monitoraProcessoEmail.sh                                                          #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 03/05/2018                                                          #
#                                                                                   #
# Descrição: Script recebe o nome de um processo e verifica se o mesmo está         #
#            sendo executado caso não esteja deverá enviar um email informando      #
#            (o script deve ficar em execução constante).                           #
#                                                                                   #
# Exemplo de uso: ./monitoraProcessoEmail.sh firefox &                              #
#                                                                                   #
#####################################################################################

clear

TIME=10
EMAIL=breno

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
		echo "ATENÇÃO!!!!!!! O processo $1 NÃO está em execução!" | mail -s "Monitoração do processo $1" $EMAIL
		sleep $TIME
	fi
done
