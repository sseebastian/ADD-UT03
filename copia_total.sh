#!/bin/bash

# Guardamos el mes y el año actuales
fecha=$(date +%B%Y)

# Creamos la copia total
tar -cjf /bacsebastian/CopTot-$fecha.tar.bz2 /home
