#!/bin/bash

#####################################################################################
#                                                                                   #
# somaValores.sh - Somar dois valares digitados pelo usuário                        #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 22/03/2018                                                          #
#                                                                                   #
# Descrição: Script fará a soma de dois valores informados pelo usuário             #
#                                                                                   #
# Exemplo de uso: ./somaValores.sh                                                  #
#                                                                                   #
#####################################################################################

clear
echo "======== Soma dos valores ========"
echo

read -p "Por favor, informe o primeiro número: " NUM01
read -p "Por favor, informe o segundo número: " NUM02

#echo $NUM01 + $NUM02 | bc
SOMA=$(expr $NUM01 + $NUM02)

echo
echo "A soma dos valores ($NUM01 e $NUM02) é: $SOMA"
echo
