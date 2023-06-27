#!/bin/bash
# Define el directorio de entrada, el archivo de salida y los patrones excluidos
input_dir="/media/sf_TFG/filesTextMFCCsConcatenated/concatenated"
output_file="/media/sf_TFG/filesTextMFCCsConcatenated/3.ConcatenadosYPrimeraColumna/trainfeature1.txt"
output_label_file="/media/sf_TFG/filesTextMFCCsConcatenated/3.ConcatenadosYPrimeraColumna/trainlabel1.txt"
excluded_patterns=("AVPEPUDEA0024" "AVPEPUDEA0035" "AVPEPUDEA0043" "AVPEPUDEA0048" "AVPEPUDEA0056"  
"AVPEPUDEAC0013" "AVPEPUDEAC0031" "AVPEPUDEAC0033" "AVPEPUDEAC0051" "AVPEPUDEAC0057")
# Contador de número de archivo
num_archivo=0

# Contador de número de línea
line_num=-1

# Crear una lista de todos los archivos en el directorio de entrada y mezclarla aleatoriamente
file_list=($(ls -1 "$input_dir"/*.txt | shuf))

# Iterar sobre los archivos en el directorio de entrada en orden aleatorio
for file in "${file_list[@]}"; do
    # Verificar si el archivo no contiene ningún patrón excluido
    excluded=false
    for pattern in "${excluded_patterns[@]}"; do
        if [[ "$file" == *"$pattern"* ]]; then
            excluded=true
            break
        fi
    done
    if [ "$excluded" = false ]; then
        # Iterar sobre cada línea del archivo actual
        while read -r line; do
            # Obtener la etiqueta correspondiente
            if [[ "$file" == *"AVPEPUDEAC"* ]]; then
                label=0
            elif [[ "$file" == *"AVPEPUDEA"* ]]; then
                label=1
            else
                label=2
            fi
            
            # Agregar número de archivo en la primera columna, número de línea en la segunda columna
            # y la etiqueta correspondiente en la tercera columna del archivo de características
            printf '%d %d %s\n' "$num_archivo" "$((++line_num))" "$line" >> "$output_file"
            
            # Agregar número de archivo en la primera columna, número de línea en la segunda columna
            # y la etiqueta correspondiente en la tercera columna del archivo de etiquetas
            printf '%d %d %d\n' "$num_archivo" "$line_num" "$label" >> "$output_label_file"
        done < "$file"
        # Aumentar el número de archivo para el siguiente archivo
        ((num_archivo++))
        # Reiniciar el contador de línea para el siguiente archivo
        line_num=-1
    fi
done 
