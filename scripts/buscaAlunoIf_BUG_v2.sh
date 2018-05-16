#!/bin/bash

#####################################################################################
#
# buscaAlunoIf.sh - Procurar nome completo do aluno
#
# Autor: Breno Cabral
# Data Criação: 02/04/2018
#
# Descrição: Caso o usuário digitar um nome como parâmetro, será feita uma
#            busca no arquivo alunos2.txt, caso contrário exibir uma 
#            mensagem informando que não foi digitado nenhum parâmetro
#
# Exemplo de uso: ./buscaAluno Maria
#
######################################################################################

ARQ_ALUNOS="/home/breno/Dropbox/workspace/curso_shell_script/arquivos_exemplos/alunos2.txt"

clear
echo "======== Script de busca de alunos ========"
echo

#Inicia o trecho em debug
set -x

#Inicia a execução passo a passo
trap read DEBUG

if [ $# -ge 0 ]
then
	NOME_COMPLETO=$(grep $1 $ARQ_ALUNOS)
	echo "O nome completo do aluno é: $NOME_COMPLETO"
else
	echo "Informe o nome do aluno como parâmetro!"
fi

#Finaliza o trecho em debug
set +x

#Finaliza a execução passo a passo
trap "" DEBUG

echo
echo "Fim do script"
