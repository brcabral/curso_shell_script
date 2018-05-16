#!/bin/bash

#####################################################################################
#                                                                                   #
# listaUsuarios.sh                                                                  #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 19/04/2018                                                          #
#                                                                                   #
# Descrição: Exibe todos os usuários "humanos" seguido de seu UID,                  #
#            diretório home e nome/descricao                                        #
#                                                                                   #
# Exemplo de uso: ./listaUsuarios.sh                                                #
#                                                                                   #
#####################################################################################

clear

MIN_UID=$(grep "^UID_MIN" /etc/login.defs | tr -s "\t" | cut -f2)
MAX_UID=$(grep "^UID_MAX" /etc/login.defs | tr -s "\t" | cut -f2)

OLDIFS=$IFS
IFS=$'\n'

#Criando o cabeçalho da saída
echo -e "USUÁRIO \t UID \t DIR HOME \t NOME OU DESCRIÇÃO"

for value in $(cat /etc/passwd)
do
	USER_ID=$(echo $value | cut -d: -f3)
	if [ $USER_ID -ge $MIN_UID -a $USER_ID -le $MAX_UID ]
	then
		USUARIO=$(echo $value | cut -d: -f1)
		DIR_HOME=$(echo $value | cut -d: -f6)
		NOME=$(echo $value | cut -d: -f5 | tr , " ")

		echo -e "$USUARIO \t\t $USER_ID \t $DIR_HOME \t $NOME"		
	fi
done


IFS=$OLDIFS
exit
