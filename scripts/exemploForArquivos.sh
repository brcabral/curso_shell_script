#!/bin/bash

clear
for i in /home/breno/Dropbox/workspace/curso_shell_script/arquivos_exemplos/*
do
	if [ -f $i ] #só executa os comandos se for arquivo
	then
		echo "Verificando o arquivo $i"
		LINHAS=$(cat $i | wc -l)
		echo "O arquivo $i contém $LINHAS linhas."
		echo
	fi
done
