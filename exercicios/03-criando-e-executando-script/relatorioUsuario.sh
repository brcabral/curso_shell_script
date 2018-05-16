#!/bin/bash

#####################################################################################
#                                                                                   #
# relatorioUsuario.sh                                                               #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 23/03/2018                                                          #
#                                                                                   #
# Descrição: Script fará um relatório com várias informações                        #
#            sobre o usuário.                                                       #
#                                                                                   #
# Exemplo de uso: ./relatorioUsuario.sh nome                                        #
#                                                                                   #
#####################################################################################

ls /home/$1 > /dev/null 2>&1 || { echo "Usuário inexistente" ; exit 1; }

USER_ID=$(cat /etc/passwd | grep $1 | cut -d: -f3)
NOME=$(grep $1 /etc/passwd | cut -d: -f5 | tr , " ")
USO_HOME=$(du -sh ~ | cut -d$'\t' -f1)
ULT_LOG=$(lastlog -u $1)

clear
echo "============================================================="
echo "Relatório do usuário: $1"
echo
echo "UID: $USER_ID"
echo "Nome ou descrição: $NOME"
echo
echo "Total usado no /home/$1: $USO_HOME"
echo
echo "Último login:"
echo "$ULT_LOG"
echo
echo "============================================================="

