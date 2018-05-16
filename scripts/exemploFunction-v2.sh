#!/bin/bash

function ler() {
	read -p "Informe o nome: " NOME
	read -p "Informe o sobrenome: " SOBRENOME
	return 10
}

ler

#echo "Return code = $?"
#echo

RETURN_CODE=$?
echo $RETURN_CODE
echo

echo $NOME $SOBRENOME
