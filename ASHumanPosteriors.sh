#!/bin/bash

# Ruta de la carpeta que contiene los archivos .pfile
carpeta="/media/sf_TFG/Augmented_System/Files/Files_train_Posteriors/files_trainPosteriors"

# Ruta del directorio donde se guardarán los archivos .txt
directorio_destino="/media/sf_TFG/Augmented_System/Files/Files_train_Posteriors/files_log_trainPosteriors"

# Iterar sobre todos los archivos .pfile dentro de la carpeta
for archivo_pfile in "$carpeta"/*.pfile; do
    # Obtener el nombre del archivo sin la extensión
    nombre_archivo=$(basename "$archivo_pfile" .pfile)
    
    # Construir la ruta del archivo de destino
    archivo_destino="$directorio_destino/${nombre_archivo}.txt"
    
    # Ejecutar el comando y redirigir la salida al archivo de destino
    /media/sf_TFG/Augmented_System/phnrec_tscripts/tools/bin/pfile_print -i "$archivo_pfile" > "$archivo_destino"
    
    # Imprimir el nombre del archivo procesado
    echo "Archivo procesado: $nombre_archivo"
done
