#!/bin/bash

#####################################################################################
#                                                                                   #
# inspecionaHome.sh                                                                 #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 24/04/2018                                                          #
#                                                                                   #
# Descrição: Script inspeciona os diretórios home de todos os usuários em busca     #
#            de arquivos com as extensões .mp3, .mp4 e .jpg.                        #
#                                                                                   #
# Exemplo de uso: ./inspecionaHome                                                  #
#                                                                                   #
#####################################################################################

clear

#diretório completo
#USUARIO=$(ls -d1 /home/* | grep -v lost)

USUARIOS=$(ls /home/ | grep -v lost)

for usuario in $USUARIOS
do
	echo "Usuário: $usuario"
	echo "Arquivos JPG: $(find /home/$usuario -name *.jpg 2> /dev/null | wc -l)"
	echo "Arquivos MP3: $(find /home/$usuario -name *.mp3 2> /dev/null | wc -l)"
	echo "Arquivos MP4: $(find /home/$usuario -name *.mp4 2> /dev/null | wc -l)"
	echo
done

