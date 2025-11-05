#!/bin/bash

ARCHIVO="/etc/hosts"

if [[ -f $ARCHIVO && -r $ARCHIVO ]]; then
    echo "Archivo seguro y accesible"
fi
