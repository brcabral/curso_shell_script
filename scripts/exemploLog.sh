#!/bin/bash

DATA_HORA=$(date +%d/%m/%Y\ %H:%M)
ARQ_ALUNOS="/home/breno/Dropbox/workspace/curso_shell_script/arquivos_exemplos/alunos2.txt"

LOG="$HOME/Dropbox/workspace/curso_shell_script/scripts/log_interno.out"

#redireciona todo o conteúdo do script para o log
#exec 1>> $LOG
#exec 2>&1

# Sessão para exibir data e hora do sistema.

echo "$(date) - Iniciando o script..." >> $LOG

clear
echo "======= Meu primeiro script ======="
echo ""
echo "Exibir data e hora atual: $DATA_HORA"

# Área de leitura da lista de alunos.:
echo "=================================="
echo "Listagem dos alunos: "
sort $ARQ_ALUNOS | tee -a $LOG

echo "=================================="
echo

echo "$(date) - Fim do script..." >> $LOG
