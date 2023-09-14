#!/bin/bash

function infosis_C(){
    ./Comandos/infosis.sh
}

function buscar_C(){
    ./Comandos/buscar.sh
}
opcion=a

while [ $opcion != salir ]; do
    printf "> "
    read opcion

    case $opcion in
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

 done



echo
echo