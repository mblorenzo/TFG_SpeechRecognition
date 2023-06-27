#!/bin/bash

# Definir los nombres de las carpetas de entrada y salida
INPUT_DIR=/media/sf_TFG/Files/Files_train_mfcc
OUTPUT_BASEDIR=/media/sf_TFG/HMMs

# Definir el nombre del archivo prototipo
PROTO_FILE=/media/sf_TFG/Files/prototype.txt

# Definir el valor del parámetro -f
F_VALUE=0.01
actual1=1
actual2=1

# Iterar a través de las carpetas de entrada
for INPUT_SUBDIR in $(ls -v $INPUT_DIR) #numericamente
do
    # Iterar a través de los archivos de entrada en la carpeta actual
    for INPUT_FILE in $(ls $INPUT_DIR/$INPUT_SUBDIR/*.txt)
    do
        # Construir el nombre de la carpeta de salida para el archivo actual
        FILENAME=$(basename $INPUT_FILE .txt)
	
	
        OUTPUT_DIR1="$OUTPUT_BASEDIR/$INPUT_SUBDIR/$actual1"
	OUTPUT_DIR="${OUTPUT_DIR1}_$actual2"
	
	echo $OUTPUT_DIR
	
	actual2=$((actual2+1))
	
        # Ejecutar HCompV con los parámetros apropiados
        ./HCompV -f $F_VALUE -m -S $INPUT_FILE -M $OUTPUT_DIR $PROTO_FILE
    done

actual1=$((actual1+1))
actual2=1
done

#./HCompV -f 0.01 -m -S /media/sf_TFG/Files/Files_train_mfcc/G1/mfcc_train_1_1.txt -M /media/sf_TFG/HMMs/G1/1_1 /media/sf_TFG/Files/prototype.txt
