#!/bin/bash

clear

until ps axu | grep firefox | grep -v grep > /dev/null
do
	echo "Inicie o Firefox..."
	sleep 3
	echo
done

echo "Firefox iniciado."
echo "PID: $(pgrep firefox)"
