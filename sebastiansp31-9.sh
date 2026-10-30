#!/bin/bash

# Sincronizamos el directorio personal con la copia espejo
rsync -a --delete /home/ud26sebastian/ /bacsebastian/espejo/

echo "Sincronizacion realizada correctamente."
