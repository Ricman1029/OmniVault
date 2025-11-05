#!/bin/bash

ARGUMENTO=$1

case $ARGUMENTO in
nginx | ssh | mysql) ;;
*)
    echo "Servicio no reconocido: $ARGUMENTO"
    ;;
esac
