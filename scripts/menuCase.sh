#!/bin/bash

#Exibir o menu
clear
echo "Escolha uma opção do menu:"
echo
echo "1 - Adicionar"
echo "2 - Remover"
echo "3 - Alterar"
echo "q - Sair"
echo
read -p "Opção: " opcao
echo

# Rotinas das opções
case "$opcao" in
	1)
		echo "Opção 1 escolhida."
		echo "Iniciar operação de inclusão..."
		sleep 3
		;;
	2)
		echo "Opção 2 escolhida."
        echo "Iniciar operação de remoção..."
        sleep 3
        ;;
	3)
		echo "Opção 3 escolhida."
        echo "Iniciar operação de alteração..."
        sleep 3
        ;;
	q)
		echo "Saindo..."
		sleep 3
		exit 0
		;;
	*)
		echo "Opção inválida"
		exit 2
		;;
esac
