#!/bin/bash

# Nombre del informe que vamos a generar
informe="informe_mantenimiento.txt"

# Vaciamos el informe antes de empezar
> "$informe"

# Recorremos los archivos que existen dentro de /var/log
find /var/log -type f 2>/dev/null | while read archivo
do
    # Buscamos lineas que contengan error o fail
    resultado=$(grep -iE "error|fail" "$archivo" 2>/dev/null)

    # Si encontramos alguna coincidencia, la guardamos en el informe
    if [ -n "$resultado" ]
    then
        echo "========================================" >> "$informe"
        echo "Archivo: $archivo" >> "$informe"
        echo "========================================" >> "$informe"
        echo "$resultado" >> "$informe"
        echo "" >> "$informe"
    fi
done

echo "Informe generado en $informe"