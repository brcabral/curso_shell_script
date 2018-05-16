#!/bin/bash

#####################################################################################
#                                                                                   #
# operacoesValores.sh                                                               #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 03/04/2018                                                          #
#                                                                                   #
# Descrição: Recebe dois valores digitados pelo usuário e em seguida a operação     #
#            que será executada com os valores recebidos.                           #
#                                                                                   #
# Exemplo de uso: ./operacoesValores.sh                                             #
#                                                                                   #
#####################################################################################

clear

read -p "Informe o primeiro número: " NUM01
read -p "Informe o segundo número: " NUM02

if [ -z "$NUM01" -o -z "$NUM02" ]             # também poderia ser usado [ ! $NUM01 ] || [ ! $NUM02 ]
then
	echo "Um ou ambos os números não foram informados"
	exit 1
fi

echo
echo "Escolha uma operação:"
echo "1 - Soma"
echo "2 - Subtração"
echo "3 - Multiplicação"
echo "4 - Divisão"
echo "q - Sair"
echo
read -p "Selecione a operação: " OPERACAO
echo

case $OPERACAO in
	1)
		echo "$NUM01 + $NUM02 = " $(expr $NUM01 + $NUM02)
		;;
	2)
		echo "$NUM01 - $NUM02 = " $(expr $NUM01 - $NUM02)
		;;
	3)
		if [ "$NUM01" -eq 0 -o "$NUM02" -eq 0 ]
		then
			echo "Um ou ambos números estão zerados!"
			exit 1
		fi		
		echo "$NUM01 * $NUM02 = " $(expr $NUM01 \* $NUM02)
		;;
	4)
		if [ "$NUM01" -eq 0 -o "$NUM02" -eq 0 ]
        then
            echo "Um ou ambos números estão zerados!"
            exit 1
        fi

		if [ $(expr $NUM01 % $NUM02) -ne 0  ]
		then
			echo "Divisão com resto = " $(expr $NUM01 % $NUM02)
		else
			echo "Divisão exata"
		fi

		echo "$NUM01 / $NUM02 = " $(expr $NUM01 / $NUM02)
		;;
	[Qq])
		echo "Saindo..."
		exit
		;;
	*)
		echo "Operação inválida!"
		exit 1
		;;
esac

