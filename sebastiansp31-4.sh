#!/bin/bash

# Recorremos los programas guardados en programas.txt
while read programa
do
    echo "Comprobando: $programa"

    # Comprobamos si el programa esta instalado
    if dpkg -s "$programa" >/dev/null 2>&1
    then
        echo "Desinstalando $programa..."
        sudo apt remove "$programa" -y
    else
        echo "$programa no esta instalado."
    fi

    echo "-----------------------------"

done < programas.txt
