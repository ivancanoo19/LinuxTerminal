#!/bin/bash

echo BIENVENIDO ---- TERMINAL LINUX

opcion=9
username=" "
password=" "

while [ opcion != 3 ]; do
    echo Selecciona una opcion:
    echo 1. Iniciar sesion
    echo 2. Registrarse
    echo 3. Salir

    read opcion

    case $opcion in 
    1)
        echo
        printf "Ingrese su nombre de usuario: "
        read username

        if [ grep -q "$username" /etc/passwd ]; then
            printf "Ingrese su contraseña: "
            read password


done