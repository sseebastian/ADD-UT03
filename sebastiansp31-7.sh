#!/bin/bash

# Fichero donde se guardaran los avisos
registro="$HOME/espacio_disco.log"

# Comprobamos cada particion del sistema
df -P | tail -n +2 | while read sistema bloques usados disponibles porcentaje montaje
do
    # Quitamos el simbolo % para poder comparar el valor
    uso=${porcentaje%\%}

    # Si supera el 80%, guardamos un aviso
    if [ "$uso" -gt 80 ]
    then
        echo "$(date '+%d/%m/%Y %H:%M:%S') - Particion: $montaje - Uso: $porcentaje" >> "$registro"
    fi
done