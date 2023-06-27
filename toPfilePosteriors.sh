#!/bin/bash

directorio_txt="$1"
directorio_pfile="$2"

for archivo in "$directorio_txt"/*.txt; do
    if [[ -f "$archivo" ]]; then
        nombre_archivo=$(basename "$archivo")
        nombre_pfile="${nombre_archivo%.txt}.pfile"
        ruta_pfile="${directorio_pfile}/${nombre_pfile}"
        feacat -i "$archivo" -ip ascii -op pfile -o "$ruta_pfile" -width 41
    fi
done
