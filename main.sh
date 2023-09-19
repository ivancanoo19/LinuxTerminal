#!/bin/bash

misComandos=(
    "ayuda"
    "fecha"
    "infosis"
    "buscar"
    "creditos"
    "juego"
    "salir"
)

comando="a  "


while ! [[ $comando =~ salir ]]; do
    #echo $USER : $PWD
    printf "\033[31m$USER\033[0m : \033[35m$PWD\033[0m"
    echo
    printf "> "
    read comando

    if grep -q "$comando" <<< "${misComandos[@]}"; then
        case $comando in
        ayuda)
            ./Comandos/ayuda.sh;;
        infosis)
            ./Comandos/infosis.sh;;
        fecha)
            ./Comandos/fecha.sh;;
        buscar)
            ./Comandos/buscar.sh;;
        juego)
            ./Comandos/juego.sh;;
        salir)
            echo Vuelva pronto;;

        *)
            echo Opcion no valida, intenta de nuevo
            echo;;

        esac
    
    else
        $comando
        
    fi

 done

echo
echo