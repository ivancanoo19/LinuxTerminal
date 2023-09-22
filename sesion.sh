#!/bin/bash

echo
echo

title(){
    echo -e "\e[36m=================================" 
    echo -e "    __    ____  ___________   __"
    echo -e "   / /   / __ \/ ____/  _/ | / /"
    echo -e "  / /   / / / / / __ / //  |/ / "
    echo -e " / /___/ /_/ / /_/ // // /|  /  "
    echo -e "/_____/\____/\____/___/_/ |_/   "

    echo                            
    echo -e "=================================\e[0m"
}


intentosMaximos=3
intentos=0

while [ "$opcion" != 3 ]; do
    title
    echo
    echo
    echo "Selecciona una opción:"
    echo "1. Iniciar sesión"
    echo "2. Registrarse"
    echo "3. Salir"

    read opcion

    case $opcion in 
    1)
        echo
        echo -n "Ingrese su nombre de usuario: "
        read username

        # Si se redirecciona algo al directorio "basura"
        # quiere decir que el usuario existe en el sistema.
        if getent passwd "$username" > /dev/null; then
            echo -n Ingresa tu contraseña:
            read password
            login=true
            if ! echo "$password" | su "$username" -c 'echo " "' 2> /dev/null; then
                echo Upsss, contraseña incorrecta
                login=false
            fi

            if $login; then
                ./main.sh $username
            fi
        else
            echo "El usuario $username no existe en el sistema. Regístrate o haz algo, ¡yo qué sé!"
        fi
        intentos=0
        ;;
    2)
        echo "Función de registro no implementada todavía."
        ;;
    3)
        echo "Saliendo..."
        ;;
    *)
        echo "Opción no válida"
        ;;
    esac
done
