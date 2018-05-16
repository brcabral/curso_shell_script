#!/bin/bash

#####################################################################################
#
# buscaAlunoParametro.sh - Procurar nome completo do aluno
#
# Autor: Breno Cabral
# Data Criação: 22/03/2018
#
# Descrição: Script de exemplo para o uso de parametro.
#            A partir de uma entrada do usuário, será feita uma
#            busca no arquivo alunos2.txt
#
# Exemplo de uso: ./buscaAlunoParametro.sh
#
######################################################################################

ARQ_ALUNOS="/home/breno/Dropbox/workspace/curso_shell_script/arquivos_exemplos/alunos2.txt"

clear
echo "======== Script de busca de alunos ========"
echo ""

NOME_COMPLETO=$(grep $1 $ARQ_ALUNOS)

echo ""
#echo "O nome completo do aluno é: $(grep $ALUNO $ARQ_ALUNOS)"
echo "O nome completo do aluno é: $NOME_COMPLETO"
echo ""
echo "Fim do script"
