#!/bin/bash

printf "Introduce un caracter: "
read letra

while [ ${#letra} != 1 ]; do
    printf "Tramposo! Introduce solamente una letra: "
    read letra
done

palabra="cereza"
longitud=${#palabra}
i=0

while [ $i -lt $longitud ]; do
    caracter="${palabra:$i:1}"
    if [ "$caracter" == "$letra" ]; then
        arr[$i]=$letra
    else
        arr[$i]="__"
    fi
    i=$((i + 1))
done

resultado=""
for elemento in "${arr[@]}"; do
    resultado="${resultado}${elemento} "
done

echo $resultado