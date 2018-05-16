#!/bin/bash

#####################################################################################
#
# buscaAluno.sh - Procurar nome completo do aluno
#
# Autor: Breno Cabral
# Data Criação: 22/03/2018
#
# Descrição: Script de exemplo para o comando read.
#            A partir de uma entrada do usuário, será feita uma
#            busca no arquivo alunos2.txt
#
# Exemplo de uso: ./buscaAluno
#
######################################################################################

ARQ_ALUNOS="/home/breno/Dropbox/workspace/curso_shell_script/arquivos_exemplos/alunos2.txt"

clear
echo "======== Script de busca de alunos ========"
echo ""
#echo -n "Por favor, informe o nome do aluno: "
#read ALUNO
read -p "Por favor, informe o nome do aluno: " ALUNO

NOME_COMPLETO=$(grep $ALUNO $ARQ_ALUNOS)

echo ""
#echo "O nome completo do aluno é: $(grep $ALUNO $ARQ_ALUNOS)"
echo "O nome completo do aluno é: $NOME_COMPLETO"
echo ""
echo "Fim do script"
