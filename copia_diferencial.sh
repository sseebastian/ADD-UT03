#!/bin/bash

# Numero de la semana actual
semana=$(date +%V)

# Creamos la copia de seguridad
tar -cjf /bacsebastian/CopDifSem-$semana.tar.bz2 /home
