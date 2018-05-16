#!/bin/bash

clear

read -p "Qual o(a) melhor aluno(a): " MELHOR

for i in $(cat ../arquivos_exemplos/alunos.txt)
do
	if [ $i = $MELHOR ]
	then
		echo "$i é o(a) melhor aluno(a)"
		break
	fi
	echo "Nome do aluno(a): $i"
done
