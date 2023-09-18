#!/bin/bash

misComandos=(
    "infosis"
    "buscar"
    "salir"
)

function infosis_C(){
    ./Comandos/infosis.sh
}

function buscar_C(){
    ./Comandos/buscar.sh
}
comando="a  "
binarios="/usr/bin/"


while ! [[ $comando =~ salir ]]; do
    echo $USER : $PWD
    printf "> "
    read comando

    if grep -q "^$comando" <<< "${misComandos[@]}"; then
        case $comando in
        infosis)
            infosis_C;;

        buscar)
            buscar_C;;


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