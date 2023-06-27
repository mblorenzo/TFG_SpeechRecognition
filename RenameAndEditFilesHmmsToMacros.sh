#!/bin/bash

# Definir la ruta base de las carpetas
ruta_base="/media/sf_TFG/HMMs"

# Iterar a través de todas las subcarpetas dentro de G1 y G10
for subcarpeta_g in $ruta_base/G*; do
  if [ -d "$subcarpeta_g" ]; then
    echo "Procesando subcarpetas de $subcarpeta_g"
    # Iterar a través de todas las subcarpetas dentro de la subcarpeta actual
    for subcarpeta in "$subcarpeta_g"/*_*; do
      if [ -d "$subcarpeta" ]; then
        # Definir el patrón de búsqueda para los archivos vFloors_copy
        patron_busqueda="$subcarpeta/vFloors_copy"
        # Iterar a través de todos los archivos coincidentes con el patrón de búsqueda
        for archivo in $patron_busqueda; do
          if [ -f "$archivo" ]; then
            # Extraer el nombre de la subcarpeta y del archivo de la ruta del archivo actual
            subcarpeta_nombre=$(basename $(dirname "$archivo"))
            archivo_nombre=$(basename "$archivo" | sed 's/vFloors_copy//')
	    # Renombrar el archivo vFloors_copy a macros$subcarpeta.txt
            archivo_renombrado="macros${subcarpeta_nombre}"
            mv "$archivo" "${subcarpeta_g}/$subcarpeta_nombre/${archivo_renombrado}"
            # Agregar la cabecera al archivo recién renombrado, con salto de línea
            echo -e "~o\n<VECSIZE> 39\n<MFCC_D_A_0>" | cat - "${subcarpeta_g}/$subcarpeta_nombre/${archivo_renombrado}" > temp && mv temp "${subcarpeta_g}/$subcarpeta_nombre/${archivo_renombrado}"
          fi
        done
      fi
    done
  fi
done
