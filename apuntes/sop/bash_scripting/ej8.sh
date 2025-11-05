#!/bin/bash

PUNTAJE=75

if [ $PUNTAJE -ge 90 ]; then
    echo "Excelente"
elif [ $PUNTAJE -ge 70 ]; then
    echo "Bueno"
else
    echo "Necesita mejorar"
fi
