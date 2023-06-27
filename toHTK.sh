#!/bin/bash

directorio_txt="$1"
directorio_pfile="$2"

for archivo in "$directorio_txt"/*.txt; do
    if [[ -f "$archivo" ]]; then
        nombre_archivo=$(basename "$archivo")
        nombre_pfile="${nombre_archivo%.pfile}.fea"
        ruta_pfile="${directorio_pfile}/${nombre_pfile}"
        feacat -debug 1 -ip pfile -op htk -o "ruta_pfile" -i "archivo" -width 41
    fi
done

