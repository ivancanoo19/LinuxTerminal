#!/bin/bash

ram=0


echo
echo Sistema operativo:
cat /etc/issue

echo Arquitectura:
echo $HOSTTYPE

    #aux=$(cat /proc/meminfo | head -n 1 | grep [0-9])
    #echo $aux
ram=$(cat /proc/meminfo | head -n 1)
printf "\nRAM " $ram
echo $ram


echo
echo