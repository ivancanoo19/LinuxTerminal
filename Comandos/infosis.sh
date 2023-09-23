#!/bin/bash

ram=0

title(){
    echo
    echo -e "\e[36m======================================================="
    echo -e "    ____      ____             __     __   _____ ____ "
    echo -e "   /  _/___  / __/___     ____/ /__  / /  / ___// __ \ "
    echo -e "   / // __ \/ /_/ __ \   / __  / _ \/ /   \__ \/ / / / "
    echo -e " _/ // / / / __/ /_/ /  / /_/ /  __/ /   ___/ / /_/ /  "
    echo -e "/___/_/ /_/_/  \____/   \__,_/\___/_/   /____/\____/   "
                                                      
    echo
    echo -e "======================================================="  
  
    echo
    echo
}

title
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
echo -e "\e[0m"