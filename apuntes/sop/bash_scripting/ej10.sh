#!/bin/bash

EXITOSO=$(pwd 2>registro.err)
if [ $? == 0 ]; then
    echo "El comando se ejecuto exitosamente"
else
    echo "El comando no se ejecuto exitosamente"
fi

FALLIDO=$(sl /home 2>registro.err)
if [ $? == 0 ]; then
    echo "El comando se ejecuto exitosamente"
else
    echo "El comando no se ejecuto exitosamente"
fi
