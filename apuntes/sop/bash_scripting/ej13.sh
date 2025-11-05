#!/bin/bash

validar_archivo() {
    NOMBRE_ARCHIVO=$1
    if [ -f $NOMBRE_ARCHIVO ]; then
        local RESULTADO=0
    else
        local RESULTADO=1
    fi

    return $RESULTADO
}

validar_archivo $1
echo $?
