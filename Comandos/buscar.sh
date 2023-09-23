#!/bin/bash

title(){
	echo
    echo -e "\e[36m====================================="
	echo -e "   _____                      __      "
  	echo -e "  / ___/___  ____ ___________/ /_"      
  	echo -e "  \__ \/ _ \/ __ \  ___/ ___/ __ \ "     
 	echo -e " ___/ /  __/ /_/ / /  / /__/ / / /"
	echo -e "/____/\___/\__,_/_/   \___/_/ /_/"
                                       
    echo
    echo -e "=====================================\e[0m"  
  
    echo
    echo 
}

title
echo NOTA: la ruta debe de terminar con "/"
printf "Directorio a buscar: "
read ruta

printf "Archivo a buscar: "
read archivo

echo

if [ -d $ruta ]; then
	if [ -e $ruta$archivo ]; then
		echo El archivo $archivo EXISTE.
	else
		echo El archivo ingresado NO EXISTE.
	fi

else
	echo La ruta ingresada no es un directorio o este no existe.


echo