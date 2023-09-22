#!/bin/bash

which mpg123 > /dev/null 2>&1

if [ $? -eq 0 ]; then
    #mpg123 SI está instalado
    echo mpg123 ya se encuentra instalado...
else
    #mpg123 NO está instalado
    echo
    echo Upss, parece que no tienes mpg123 instalado.
    echo IMPORTANTE: solo para distribuciones basadas en debian
    echo -n ¿Quieres instalar mpg123? Necesito una respuesta ahora "(si/no): "
    read op

    while [[ $op != "si" && $op != "no" ]]; do
        echo -n Introduce solamente "(si/no): " 
        read op
    done

    if [ $op = "si" ]; then
        echo Instalando mpg123...
        sudo apt update
        sudo apt install mpg123
        echo 
        mpg123 --version
    else
        echo Uy perdon, de regreso...
    fi
fi

echo