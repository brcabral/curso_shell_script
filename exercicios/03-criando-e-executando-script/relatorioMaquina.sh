#!/bin/bash

#####################################################################################
#                                                                                   #
# relatorioMaquina.sh                                                               #
#                                                                                   #
# Autor: Breno Cabral                                                               #
# Data Criação: 22/03/2018                                                          #
#                                                                                   #
# Descrição: Script gera um relatório com informações sobre                         #
#            este computador.                                                       #
#                                                                                   #
# Exemplo de uso: ./relatorioMaquina.sh                                             #
#                                                                                   #
#####################################################################################

NOME_COMP=$(hostname)
DATA=$(date)
QTD_CPU=$(cat /proc/cpuinfo | grep "cpu cores" | head -n1 | cut -d" " -f3)
MOD_CPU=$(cat /proc/cpuinfo | grep "model name" | head -n1 | cut -d: -f2 | cut -c2-)
#MOD_CPU=$(cat /proc/cpuinfo | grep "model name" | head -n1 | cut -c14-)
TOT_MEMO=$(expr $(cat /proc/meminfo | grep MemTotal | tr -d ' ' | cut -d: -f2 | tr -d kB) / 1024)
PARTITIONS=$(df -ht ext4)
#PARTITIONS=$(df -h | egrep -v '(tmpfs|udev)')

clear
echo "========================================================="
echo "Relatório da máquina: $NOME_COMP"
echo "Data/Hora: ${DATA,,}"
echo "========================================================="
echo
echo "Máquina ativa desde: $(uptime -s)"
echo
echo "Versão do Kernel: $(uname -r)"
echo
echo "CPUs:"
echo "Quantidade de CPUs/Core: $QTD_CPU"
echo "Modelo da CPU: $MOD_CPU"
echo
echo "Memória total: $TOT_MEMO MB"
echo
echo "Partições:"
echo "$PARTITIONS"
echo
echo "========================================================="
