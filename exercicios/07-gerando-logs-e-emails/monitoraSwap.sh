#!/bin/bash

#####################################################################################
#                                                                                   #
# monitoraSwap.sh                                                                   #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 04/05/2018                                                          #
#                                                                                   #
# Descrição: Script monitora o uso de swap do sistema ele deve ter dois limites     #
#            de uso, caso exceda o primeiro deve gerar um log e caso exceda o       #
#            segundo deve enviar um email para o administrador.                     #
#                                                                                   #
# Exemplo de uso: ./monitoraSwap.sh                                                 #
#                                                                                   #
#####################################################################################

EMAIL=breno
LIMITE_LOG=50
LIMITE_MAIL=80

EM_USO=$(free -m | grep Swap | tr -s " " | tr -s " " ":" | cut -d: -f3)
TOTAL=$(free -m | grep Swap | tr -s " " | tr -s " " ":" | cut -d: -f2)

#PERC_USO=90
PERC_USO=$(expr $EM_USO \* 100 / $TOTAL)

if [ $PERC_USO -gt $LIMITE_LOG ]
then
	logger -p local0.warn -t [$(basename $0)] "A Swap ultrapassou o uso de $LIMITE_LOG%."
	if [ $PERC_USO -gt $LIMITE_MAIL ]
	then
		echo "A Swap ultrapassou o uso de $LIMITE_MAIL%." | mail -s "Limite da Swap" $EMAIL
	fi
fi
