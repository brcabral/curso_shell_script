#!/bin/bash

function adiciona() {
	SOMA=$(expr $1 + $2)
	#return $SOMA
}

adiciona 10 20

#echo $?

echo $SOMA
echo $1 $2
