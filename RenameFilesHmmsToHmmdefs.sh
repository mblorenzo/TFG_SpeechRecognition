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
        # Definir el patrón de búsqueda para los archivos prototype_copy
        patron_busqueda="$subcarpeta/prototype_copy"
        # Iterar a través de todos los archivos coincidentes con el patrón de búsqueda
        for archivo in $patron_busqueda; do
          if [ -f "$archivo" ]; then
            # Extraer el nombre de la subcarpeta y del archivo de la ruta del archivo actual

            subcarpeta_nombre=$(basename $(dirname "$archivo"))

            archivo_nombre=$(basename "$archivo" | sed 's/prototype_copy//')

	    # Renombrar el archivo vFloors_copy a hmmdefs$subcarpeta

            archivo_renombrado="hmmdefs${subcarpeta_nombre}"
            
            mv "$archivo" "${subcarpeta_g}/${subcarpeta_nombre}/${archivo_renombrado}"
	  fi
        done	
      fi
    done
   fi
done
