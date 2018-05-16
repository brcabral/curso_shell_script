#!/bin/bash

DATA_HORA=$(date +%d/%m/%Y\ %H:%M)
ARQ_ALUNOS="/home/breno/Dropbox/workspace/curso_shell_script/arquivos_exemplos/alunos2.txt"

# Sessão para exibir data e hora do sistema.

logger -p local0.warn -t [$0] "Iniciando o script"
#echo "Iniciando o script..." | logger -p local0.warn -t [$0]

clear
echo "======= Meu primeiro script ======="
echo ""
echo "Exibir data e hora atual: $DATA_HORA"

# Área de leitura da lista de alunos.:
echo "=================================="
echo "Listagem dos alunos: "
sort $ARQ_ALUNOS | tee -a >(logger -p local0.warn -t [$0])

echo "=================================="
echo

logger -p local0.warn -t [$0] "Fim do script"
#echo "$(date) - Fim do script..." | logger -p local0.warn -t [$0]
