#!/bin/bash

#####################################################################################
#                                                                                   #
# geraBackupHome.sh                                                                 #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 03/04/2018                                                          #
#                                                                                   #
# Descrição: Gera backup do diretório home em um arquivo compactado.                #
#                                                                                   #
# Exemplo de uso: ./geraBackupHome.sh                                               #
#                                                                                   #
#####################################################################################

DIRETORIO=$HOME/Backup

clear
if [ ! -d $DIRETORIO ]
then
	echo "Criando diretório $DIRETORIO..."
	mkdir -p $DIRETORIO
fi

DAYS7=$(find $DIRETORIO -ctime -7 -name backup_home\*tgz)

if [ "$DAYS7" ]
then
	echo "Já foi gerado um backup do diretório $HOME nos últimos 7 dias."
	echo -n "Deseja continuar? (n/s): "
	read -n1 OPCAO
	echo

	if [ $OPCAO = "s" ]
	then
		echo "Será criado mais um backup para a mesma semana"
	else
		echo "Backup cancelado!"
		exit 1
	fi
fi

echo "Criando backup..."

ARQUIVO="backup_home_$(date +%Y%m%d%H%M).tgz"

#tar zcvpf $DIRDEST/$ARQ --exclude="$DIRDEST" "$HOME"/* > /dev/null
tar -zcvPf $DIRETORIO/$ARQUIVO $HOME//Dropbox/workspace/curso_shell_script/exercicios/04-instrucoes-condicionais/texto >> /dev/null

echo "O backup de nome $ARQUIVO foi criado em $DIRETORIO"
echo "Backup concluído!"
