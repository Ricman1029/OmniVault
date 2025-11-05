#!/bin/bash

obtener_ruta() {
    echo "/var/backups/"
}

RUTA=$(obtener_ruta)
mkdir $RUTA
