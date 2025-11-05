#!/bin/bash

ARCHIVO1=/home/ricman/uni/apuntes/sop/bash_scripting/fileA.txt
ARCHIVO2=/home/ricman/uni/apuntes/sop/bash_scripting/fileB.txt

if [ $ARCHIVO1 -nt $ARCHIVO2 ]; then
    echo "El archivo $ARCHIVO1 es mas reciente que el $ARCHIVO2"
elif [ $ARCHIVO2 -nt $ARCHIVO1 ]; then
    echo "El archivo $ARCHIVO2 es mas reciente que el $ARCHIVO1"
else
    echo "Los archivos $ARCHIVO1 y $ARCHIVO2 fueron creados al mismo tiempo"
fi
