#!/bin/bash
DIRECTORIO=/home/ricman/uni/apuntes/sop/bash_scripting/
ARCHIVO=ej4.sh

if [ -d $DIRECTORIO ]; then
    echo "El directorio $DIRECTORIO existe"
    if [ -f $DIRECTORIO/$ARCHIVO ]; then
        echo "El archivo $ARCHIVO exite dentro del directorio $DIRECTORIO"
    else
        echo "El archivo $ARCHIVO no exite dentro del directorio $DIRECTORIO"
    fi
else
    echo "El directorio $DIRECTORIO no existe"
fi
