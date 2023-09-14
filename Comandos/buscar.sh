#!/bin/bash

printf "> "
read op


if [ $op == buscar ]; then
	echo NOTA: la ruta debe de terminar con "/"
	printf "Directorio a buscar: "
	read ruta

	printf "Archivo a buscar: "
	read archivo

	if [ -d $ruta ]; then
		if [ -e $ruta$archivo ]; then
			echo El archivo $archivo EXISTE.
		else
			echo El archivo ingresado NO EXISTE.
		fi

	else
		echo La ruta ingresada no es un directorio o este no existe.
	fi

fi
