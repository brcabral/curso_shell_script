#!/bin/bash

#####################################################################################
#                                                                                   #
# monitoraFS.sh                                                                     #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 03/05/2018                                                          #
#                                                                                   #
# Descrição: Script verifica a utilização de todas as partições e envia um email    #
#            de alerta e gerar arquivo de log quando uma partição estiver acima     #
#            de um limite estabelecido dentro do script.                            #
#                                                                                   #
# Exemplo de uso: ./monitoraFS.sh                                                   #
#                                                                                   #
#####################################################################################

EMAIL=breno
MSG_MAIL="/tmp/msg_email"
LOG="$HOME/Dropbox/workspace/curso_shell_script/exercicios/07-Gerando-Logs-e-Emails/monitoraFS.log"
LIMITE=40

PARTICOES=$(df -h | grep sda | tr -s " " | tr -s " " ":")

for i in $PARTICOES
do
	DESC_PART=$(echo $i | cut -c1-9)
	USO_PART=$(echo $i | cut -d: -f5 | tr -d %)

	if [ $USO_PART -ge $LIMITE ]
    then
		echo "A partição $DESC_PART está acima do limite. O limite é $LIMITE%, a partição está usando $USO_PART%." >> $LOG
		echo "A partição $DESC_PART está acima do limite. O limite é $LIMITE%, a partição está usando $USO_PART%." >> $MSG_MAIL
		mail -s "Limite da partição $DESC_PART ultrapassado" $EMAIL < $MSG_MAIL
		rm -f $MSG_MAIL
	fi
done
