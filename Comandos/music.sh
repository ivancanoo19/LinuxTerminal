#!/bin/bash

title(){
    echo
    echo -e "\e[36m======================================================="
    echo -e "    __  ___                "     
    echo -e "   /  |/  /_  _______(_)________ _  "
    echo -e "  / /|_/ / / / / ___/ / ___/ __  /  "
    echo -e " / /  / / /_/ (__  ) / /__/ /_/ / "
    echo -e "/_/  /_/\__,_/____/_/\___/\__,_/  "
                                                                                                                                 
    echo
    echo -e "======================================================="   
    echo
    echo
}


title
rutaPredeterminada="../playlist/"
playlist="userPlaylist.m3u"  # Define la variable playlist aquí

controles(){
    echo
    echo "[f] Siguiente cancion"
    echo "[d] Cancion anterior"
    echo "[s] Pausar/Reproducir"
    echo "[-] Bajar volumen"
    echo "[+] Subir volumen"
    echo "[l] Mostrar la cancion actual"
    echo "[q] Salir"
    echo
}

#default recibe la ruta predeterminada del sistema para tomarla como playlist
default(){
    echo
    find "$1" -type f -name "*.mp3" > "$playlist"

    if ! [ -s "$playlist" ]; then
        echo La playlist no contiene archivos mp3 para ser creada! Agrega canciones plox.
        return
    else
        echo Se usara la playlist predeterminada del programa!
        echo "¿Deseas que la playlist tenga una lógica circular? Esto significa que no termina hasta que tu lo indiques :D"
        echo -n "Opcion [si/no]: "
        read circular

        while [[ "$circular" != "si" && "$circular" != "no" ]]; do
            echo -n "Por favor, solo introduce si o no: "
            read circular
        done

        controles
        if [ "$circular" = "si" ]; then 
            mpg123 -Z -q -@ "$playlist"
        else
            mpg123 -z -q -@ "$playlist"
        fi
        
    fi

    echo
}

rutaEspecifica(){
    echo
    echo -n "Introduce el directorio en donde tienes tu playlist (importante que termine en '/'): "
    read ruta

    if ! [ -d "$ruta" ]; then
        echo Error, la ruta ingresada no es un directorio.
        echo
    else
        echo
        find "$ruta" -type f -name "*.mp3" > "$playlist"

        if ! [ -s "$playlist" ]; then
            echo La playlist no contiene archivos mp3 para ser creada! Agrega canciones plox.
            echo
            
        else
            echo Se usara tu playlist ingresada :D
            echo "¿Deseas que la playlist tenga una lógica circular? Esto significa que no termina hasta que tu lo indiques :D"
            echo -n "Opcion [si/no]: "
            read circular

            while [[ "$circular" != "si" && "$circular" != "no" ]]; do
                echo -n "Por favor, solo introduce si o no: "
                read circular
            done

            controles
            if [ "$circular" = "si" ]; then 
                mpg123 -Z -q -@ "$playlist"
            else
                mpg123 -z -q -@ "$playlist"
            fi
        fi


    fi
}

which mpg123 > /dev/null 2>&1

if [ $? -eq 0 ]; then
    #mpg123 SI está instalado
    opcion1=9


    while [ $opcion1 -ne 3 ]; do
        echo "Menu principal: "
        echo "1. Reproducir playlist predeterminado de la terminal (o sea mío jeje)."
        echo "2. Reproducir playlist indicando la ruta específica."
        echo "3. Salir."
        echo -n "Selecciona una opcion: "
        read opcion1
        
        case $opcion1 in 
            1)
            default $rutaPredeterminada
            ;;
            2)
            rutaEspecifica
            ;;
            3)
            echo Regresa pronto :D
            rm $playlist
            exit 0
            ;;
            *)
            echo Opcion no valida, intenta de nuevo.
            ;;

        esac


    done
    
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
echo -e "\e[0m"
echo