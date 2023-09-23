#!/bin/bash

ram=0


echo
echo Sistema operativo:
cat /etc/issue | awk '{print $1, $2, $3}'

echo Arquitectura:
arch

ram=$(cat /proc/meminfo | head -n 1)
printf "\nRAM " $ram
echo $ram

echo
echo Procesador:
cat /proc/cpuinfo | grep "model name" | head -n 1 | cut -d ":" -f 2-

echo
echo