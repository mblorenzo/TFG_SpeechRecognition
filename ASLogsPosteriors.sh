#!/bin/bash

# Directorio de entrada
input_directory="/media/sf_TFG/Augmented_System/Files/files_log_testPosteriors/files_duplicated"

# Directorio de salida
output_directory="/media/sf_TFG/Augmented_System/Files/files_log_testPosteriors/files_logs"

# Iterar sobre todos los archivos en el directorio de entrada
for input_file in "$input_directory"/*; do
    # Obtener el nombre del archivo sin la ruta
    filename=$(basename "$input_file")
    
    # Construir la ruta del archivo de salida
    output_file="$output_directory/${filename%.txt}.log"
    
    # Ejecutar el comando awk y redirigir la salida al archivo de salida
    awk '{print $1 " " $2 " " 20*log($3)/log(10) " " 20*log($4)/log(10)}' "$input_file" > "$output_file"
    
    # Imprimir el nombre del archivo procesado
    echo "Archivo procesado: $filename"
done
