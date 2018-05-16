#!/bin/bash

#####################################################################################
#                                                                                   #
# criaArquivo.sh                                                                    #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 24/04/2018                                                          #
#                                                                                   #
# Descrição: Script cria um arquivo, preenche com um conjunto de caracteres até     #
#            que o arquivo atinja um determinado tamanho. O usuário quem deve       #
#            informar o nome do arquivo, o conjunto de caracteres e o               #
#            e o tamanho do arquivo                                                 #
#                                                                                   #
# Exemplo de uso: ./criaArquivo                                                     #
#                                                                                   #
#####################################################################################

clear

read -p "Informe o nome do arquivo a ser criado: " ARQUIVO
read -p "Informe um conjunto de caracteres que será usado para preencher o arquivo: " CHAR
read -p "Informe o tamanho final do arquivo (em bytes): " TAM_ARQ

> $ARQUIVO
#echo -n > $ARQUIVO.out

PERC=0

until [ $TAM_ARQ -le $(stat --printf=%s "$ARQUIVO") ]
do
	echo -n $CHAR >> $ARQUIVO
	TAM_ATUAL=$(stat --printf=%s $ARQUIVO)

	PERC_ATUAL=$(expr $TAM_ATUAL \* 100 / $TAM_ARQ)

	if [ $(expr $PERC_ATUAL % 10) -eq 0 -a $PERC -ne $PERC_ATUAL ]
	then
		echo "Concluído: $PERC_ATUAL% - Tamanho do arquivo: $TAM_ATUAL"
		PERC=$PERC_ATUAL
	fi
done
