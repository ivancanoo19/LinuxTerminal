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

title(){
    echo
    echo -e "\e[36m================================================================================"
    echo -e "    __    _____   ____  ___  __    ________________  __  ________   _____    __ "
    echo -e "   / /   /  _/ | / / / / / |/ /   /_  __/ ____/ __ \/  |/  /  _/ | / /   |  / / "
    echo -e "  / /    / //  |/ / / / /|   /     / / / __/ / /_/ / /|_/ // //  |/ / /| | / /  "
    echo -e " / /____/ // /|  / /_/ //   |     / / / /___/ _, _/ /  / // // /|  / ___ |/ /___"
    echo -e "/_____/___/_/ |_/\____//_/|_|    /_/ /_____/_/ |_/_/  /_/___/_/ |_/_/  |_/_____/"

    echo
    echo -e "================================================================================\e[0m"  

    echo
    echo                         
}

comando="a  "
title

while ! [[ $comando =~ salir ]]; do
    #echo $USER : $PWD
    printf "\033[31m$USER\033[0m : \033[35m$PWD\033[0m"
    echo
    printf "> "
    read comando

    if grep -q "$comando" <<< "${misComandos[@]}"; then
        case $comando in
        ayuda)
            title
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