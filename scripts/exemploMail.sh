#!/bin/bash

DATA_HORA=$(date +%d/%m/%Y\ %H:%M)
ARQ_ALUNOS="/home/breno/Dropbox/workspace/curso_shell_script/arquivos_exemplos/alunos2.txt"
ADMIN=breno

# Sessão para exibir data e hora do sistema.

#echo "$(date): Iniciando o script" >> /tmp/msg_temp
CONTEUDO="$(date): Iniciando o script (var)\n"

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

#echo "$(date): Fim do script" >> /tmp/msg_temp
CONTEUDO="$CONTEUDO$(date): Fim do script (var)\n"

#mail -s "Relatório de excecução do $0" $ADMIN < /tmp/msg_temp
#rm -f /tmp/msg_temp
echo -e "$CONTEUDO" | mail -s "Relatório do script $0" $ADMIN
