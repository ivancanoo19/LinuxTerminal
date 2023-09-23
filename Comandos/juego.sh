#!/bin/bash

title(){
    echo
    echo -e "\e[36m======================================================="
    echo -e "    ___    __                              __    "
    echo -e "   /   |  / /_  ____   ___  ___  ____  ___/ /__  "
    echo -e "  / /| | / __ \/ __ \/ ___/ ___/ __  / __  / __ \ "
    echo -e " / ___ |/ / / / /_/ / /  / /__/ /_/ / /_/ / /_/ / "
    echo -e "/_/  |_/_/ /_/\____/_/   \___/\__,_/\__,_/\____/ "                                                                                               
    echo
    echo -e "=======================================================\e[0m"  
  
    echo
    echo
}

intentos_0(){
    echo "   ================"
    echo "   |           |"
    echo "   |           |"
    echo "   |        \(⁠>⁠▂⁠<⁠)/"
    echo "   |         \| |/"
    echo "   |          | |"
    echo "   |         _/ \_"
    echo "   |"
    echo "   |"
    echo "======="
}

intentos_1(){
    echo "   ================"
    echo "   |           |"
    echo "   |           |"
    echo "   |        \(⁠>⁠▂⁠<⁠)/"
    echo "   |         \| |/"
    echo "   |          | |"
    echo "   |         _/"
    echo "   |"
    echo "   |"
    echo "======="
}

intentos_2(){
    echo "   ================"
    echo "   |           |"
    echo "   |           |"
    echo "   |        \(⁠>⁠▂⁠<⁠)/"
    echo "   |         \| |/"
    echo "   |          | |"
    echo "   |         "
    echo "   |"
    echo "   |"
    echo "======="
}

intentos_3(){
    echo "   ================"
    echo "   |           |"
    echo "   |           |"
    echo "   |        \(⁠>⁠▂⁠<⁠)"
    echo "   |         \| |"
    echo "   |          | |"
    echo "   |         "
    echo "   |"
    echo "   |"
    echo "======="
}

intentos_4(){
    echo "   ================"
    echo "   |           |"
    echo "   |           |"
    echo "   |         (⁠>⁠▂⁠<⁠)"
    echo "   |          | |"
    echo "   |          | |"
    echo "   |          "
    echo "   |"
    echo "   |"
    echo "======="
}

intentos_5(){
    echo "   ================"
    echo "   |           |"
    echo "   |           |"
    echo "   |         (⁠>⁠▂⁠<⁠)"
    echo "   |         "
    echo "   |         "
    echo "   |         "
    echo "   |"
    echo "   |"
    echo "======="
}

intentos_6(){
    echo "   ================"
    echo "   |         "
    echo "   |         "
    echo "   |         "
    echo "   |         "
    echo "   |         "
    echo "   |         "
    echo "   |"
    echo "   |"
    echo "======="
}

# Define un conjunto de palabras
palabras=("manzana" "pera" "uva" "naranja" "platano" "sandia" "cereza" "fresa" "kiwi" "melocoton"
          "londres" "inglaterra" "mexico" "argentina" "uruguay" "españa" "madrid" "barcelona" "andorra" "canada"
          "messi" "ronaldo" "ronaldinho" "cristiano" "xavi" "iniesta" "modric" "mbappe" "haaland" "puyol"
          "debian" "fedora" "gentoo" "ubuntu" "mint" "redhat" "centos" "linux" "arch" "kali"
          "java" "c" "c++" "python" "javascript" "php" "ruby" "c#" "baisc" "fortran")

# Selecciona una palabra al azar del arreglo
indice=$(($RANDOM %50))
palabra="${palabras[$indice]}"

intentos=6
arr=()
n=${#palabra}
adivinado=false  # Variable para rastrear si la palabra ha sido adivinada

# Inicializa el array con guiones bajos
for ((i = 0; i < n; i++)); do
    arr[$i]="__"
done


title
echo
echo
echo "Palabra a adivinar: "${arr[@]}""

while [ $intentos -gt 0 ]; do
    echo
    echo

    if [ $intentos -eq 6 ]; then
        intentos_6
    elif [ $intentos -eq 5 ]; then
        intentos_5
    elif [ $intentos -eq 4 ]; then
        intentos_4
    elif [ $intentos -eq 3 ]; then
        intentos_3
    elif [ $intentos -eq 2 ]; then
        intentos_2
    else [ $intentos -eq 1 ]
        intentos_1    
    fi

    echo
    echo

    echo -n -e "\e[34mIntroduce una letra: \e[0m"
    read letra

    while [ ${#letra} != 1 ]; do
        echo -n -e  "\e[35mPor favor, introduce solamente una letra: \e[0m"
        read letra
    done

    encontrado=false

    for ((i = 0; i < n; i++)); do
        caracter="${palabra:$i:1}"
        if [ "$caracter" == "$letra" ]; then
            arr[$i]=$letra
            encontrado=true
        fi
    done

    if [ "$encontrado" == "false" ]; then
        intentos=$((intentos - 1))
        echo -e "\e[31mLetra incorrecta. Intentos restantes: $intentos\e[0m"
    else 
        echo -e "\e[31m¡Letra correcta!. Intentos restantes: $intentos\e[0m"
    fi

    resultado=""
    for char in "${arr[@]}"; do
        resultado="${resultado}${char} "
    done

    echo
    echo "Palabra a adivinar: $resultado"

    adivinado=true

    for char in "${arr[@]}"; do
        if [ "$char" == "__" ]; then
            adivinado=false
            break
        fi
    done

    if [ "$adivinado" == "true" ]; then
        break
    fi
done

if [ "$adivinado" == "true" ]; then
    echo "¡Felicidades! Adivinaste la palabra: $palabra"
else
    echo "Agotaste tus intentos. La palabra era: $palabra"
    intentos_0
fi

echo
echo
