#!/bin/bash

function maiuscula () {
	#echo $1 | tr a-z A-Z

	local VAR1=$(echo $1 | tr a-z A-Z)
}

#maiuscula shell

#maiuscula $1

#VAR=$(maiuscula sheel)
#echo $VAR


maiuscula script
echo $VAR1
