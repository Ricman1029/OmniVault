#!/bin/bash

while IFS=, read -r nombre edad; do
    echo "El usuario <$nombre> tiene <$edad> años."
done <$1
