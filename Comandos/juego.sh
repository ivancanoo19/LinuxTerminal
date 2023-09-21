#!/bin/bash

intentos=6
arr=()
palabra="cereza"
n=${#palabra}
adivinado=false  # Variable para rastrear si la palabra ha sido adivinada

# Inicializa el array con guiones bajos
for ((i = 0; i < n; i++)); do
    arr[$i]="__"
done

echo "${arr[*]}"

while [ $intentos -gt 0 ]; do
    printf "Introduce una letra: "
    read letra

    while [ ${#letra} != 1 ]; do
        printf "Por favor, introduce solamente una letra: "
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
        echo "Letra incorrecta. Intentos restantes: $intentos"
    fi

    resultado=""
    for char in "${arr[@]}"; do
        resultado="${resultado}${char} "
    done

    echo $resultado

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
fi

echo
echo
