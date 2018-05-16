#!/bin/bash

#####################################################################################
#                                                                                   #
# funcoesDiversas.sh                                                                #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 01/05/2018                                                          #
#                                                                                   #
# Descrição: Script recebe uma opção e uma data e verifica o formato da data        #
#            inverte o formato, inclue barras, exibe por extenso ou exibe o help    #
#            de acordo com o parâmetro passado.                                     #
#                                                                                   #
# Exemplo de uso: ./funcoesDiversas.sh -f 05012013                                  #
#                                                                                   #
#####################################################################################

function retornaFormato() {
	N1=$(echo $1 | tr -d / | cut -c1-2)
	N2=$(echo $1 | tr -d / | cut -c3-4)

	if [ $N1 -ge 1 -a $N1 -le 12 -a $N2 -ge 1 -a $N2 -le 12 ]
	then
		return 2
	elif [ $N1 -gt 12 -a $N2 -gt 12 ]
	then
		return 3
	elif [ $N1 -ge 1 -a $N1 -le 31 -a $N2 -ge 1 -a $N2 -le 12 ]
	then
		return 0
	elif [ $N1 -ge 1 -a $N1 -le 12 -a $N2 -ge 1 -a $N2 -le 31 ]
	then
		return 1
	else
		return 3
	fi
}

function inverteDiaMes() {
	N1=$(echo $1 | tr -d / | cut -c1-2)
	N2=$(echo $1 | tr -d / | cut -c3-4)
	N3=$(echo $1 | tr -d / | cut -c5-8)

	#pode usar o retorno da funcao retornaFormato para validar a data
	if [ $N1 -le 31 -a $N2 -le 12 -o $N2 -le 31 -a $N1 -le 12 ]
	then
		echo "$N2/$N1/$N3"
	else
		echo "Data inválida!"
	fi
}

function incluiBarra() {
	N1=$(echo $1 | tr -d / | cut -c1-2)
    N2=$(echo $1 | tr -d / | cut -c3-4)
    N3=$(echo $1 | tr -d / | cut -c5-8)

	if [ $N1 -le 31 -a $N2 -le 12 -o $N2 -le 31 -a $N1 -le 12 ]
    then
        echo "$N1/$N2/$N3"
    else
        echo "Data inválida!"
    fi
}


function dataExtenso() {
	N1=$(echo $1 | tr -d / | cut -c1-2)
    N2=$(echo $1 | tr -d / | cut -c3-4)
    N3=$(echo $1 | tr -d / | cut -c5-8)

	if [ $N1 -ge 1 -a $N1 -le 12 -a $N2 -ge 1 -a $N2 -le 12 ]
    then
		echo "Impossível determinar o padrão da data."
		echo "1 - BR (DD/MM/YYYY)"
		echo "2 - US (MM/DD/YYYY)"
		read -p "Informe o formato (1 ou 2): " FORMATO

		case $FORMATO in
			1)
				DIA=$N1
				MES=$N2
				;;
			2)
				DIA=$N2
				MES=$N1
				;;
			*)
				echo "Formato inválido!"
				exit 3
				;;
		esac
    elif [ $N1 -gt 12 -a $N2 -gt 12 ]
    then
		echo "Data inválida!"
		exit 3
    elif [ $N1 -ge 1 -a $N1 -le 31 -a $N2 -ge 1 -a $N2 -le 12 ]
    then
		DIA=$N1
		MES=$N2
    elif [ $N1 -ge 1 -a $N1 -le 12 -a $N2 -ge 1 -a $N2 -le 31 ]
    then
		DIA=$N2
		MES=$N1
    else
		echo "Data inválida!"
		exit 3
    fi

	case $MES in
		01)
    		S_MES="Janeiro"
            ;;
		02)
            S_MES="Fevereiro"
            ;;
		03)
            S_MES="Março"
            ;;
        04)
            S_MES="Abril"
            ;;
        05)
            S_MES="Maio"
            ;;
        06)
            S_MES="Junho"
            ;;
        07)
            S_MES="Julho"
            ;;
        08)
            S_MES="Agosto"
            ;;
        09)
            S_MES="Setembro"
            ;;
        10)
            S_MES="Outubro"
            ;;
        11)
            S_MES="Novembro"
            ;;
        12)
            S_MES="Dezembro"
            ;;
	esac
        	
	echo "$DIA de $S_MES de $N3"
}

function help() {
	echo "Uso ./FuncoesDiversas.sh OPÇÃO DATA"
	echo
	echo "DATA nos formatos DDMMYYYY ou MMDDYYYY, com ou sem /"
	echo
	echo "Opções:"
	echo "-f = Retorna 0 para BR, 1 para US e 2 quando impossível determinar, 3 Inválido"
	echo "-i = Inverte formato BR para US e US para BR. Inclui as Barras"
	echo "-b = Inclui Barras de Data. Exemplo: de 13081981 para 13/08/1981"
	echo "-e = Exibe a data em formato extenso. Exemplo de 13081918 para 13 de Agosto de 1981"
}

######################
#  INICIO DO SCRIPT  #
######################

#pode criar as variáveis N1, N2 e N3 como globais

case $1 in
	-f)
		retornaFormato $2
		echo $?
		;;
	-i)
		inverteDiaMes $2
		;;
	-b)
		incluiBarra $2
		;;
	-e)
		dataExtenso $2
		;;
	--help)
		help
		;;
	*)
		echo "Parâmetro inválido!"
		;;
esac

