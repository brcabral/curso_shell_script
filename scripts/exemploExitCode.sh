#/bin/bash

ls /tmp/

# código de erro padrão do comando abaixo é 2
ls /tmp/outroArquivo

# Armazena o código de retorno na variável RETURN_CODE
RETURN_CODE=$?
echo "O código de retorno do ls foi $RETURN_CODE"

# Forçando a sair do script e configura 10 como o código de retorno. 
exit 10

echo "Script executado!"
