#!/bin/bash

#####################################################################################
#                                                                                   #
# primeiroScript.sh - Script de Exemplo do Curso                                    #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 15/03/2018                                                          #
#                                                                                   #
# Descrição: Script de exemplo que lê data e hora atual e exibe a lista de alunos   #
#                                                                                   #
# Exemplo de uso: ./primeiroScript [parametros]                                     #
#                                                                                   #
# Versão: 1.0 - 15/03/2018                                                          #
# 	Criação                                                                     #
#                                                                                   #
# Versão: 1.1 - 16/03/2018                                                          #
#	Inclusão da Função de ordenação                                             #
#	Correção da função de leitura                                               #
#                                                                                   #
# Versão 1.2 - 21/03/2018                                                           #
#	Criação do cabeçalho com comentários.                                       #
#                                                                                   #
#####################################################################################

DATA_HORA=$(date +%d/%m/%Y\ %H:%M)
ARQ_ALUNOS="/home/breno/Dropbox/workspace/curso_shell_script/arquivos_exemplos/alunos2.txt"

# Sessão para exibir data e hora do sistema.
clear
echo "===== Meu primeiro script ====="
echo ""
echo "Exibir data e hora atual: $DATA_HORA"

# Área de leitura da lista de alunos.:
echo "==============================="
echo "Listagem dos alunos: "
sort $ARQ_ALUNOS
