#!/bin/bash

NUMERO_DE_USUARIOS=$1

for ((i = 1; i <= $NUMERO_DE_USUARIOS; i++)); do
    mkdir user$i
    for ((j = 1; j <= 5; j++)); do
        touch user$i/log_0$j
    done
done
