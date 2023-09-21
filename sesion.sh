#!/bin/bash

echo "BIENVENIDO ---- TERMINAL LINUX"

intentosMaximos=3
intentos=0

while [ "$opcion" != 3 ]; do
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
            while [ $intentos -lt $intentosMaximos ]; do
                su "$username"

                if [ $? -eq 0 ]; then
                    echo INICIO DE SESION EXITOSO
                else
                    echo
                    echo Upssss, contraseña incorrecta.
                    intentos=$((intentos+1))
                fi
            done

            if [ $intentos -eq $intentosMaximos ]; then
                echo "Has alcanzado el número máximo de intentos. Bloqueando el acceso."
            fi
        else
            echo "El usuario $username no existe en el sistema. Regístrate o haz algo, ¡yo qué sé!"
        fi
        intentos=0
        ;;
    2)
        # Aquí puedes agregar la lógica para registrar un nuevo usuario en el sistema.
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
