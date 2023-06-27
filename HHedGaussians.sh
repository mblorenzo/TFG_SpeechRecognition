#!/bin/bash

# Definir los nombres de las carpetas de entrada y salida

macros_dir=/media/sf_TFG/HMMs
hmmdefs_dir=/media/sf_TFG/HMMs

output_dir=/media/sf_TFG/HMMs_gaussians

# Definir el nombre del archivo clase
classes_dir=/media/sf_TFG/Files/classes.txt
addGaussians_dir=/media/sf_TFG/Files/addGaussians.txt

# Iterar sobre las subcarpetas G1..G10
for g in {1..10}; do

  macros_subdir=$macros_dir/G$g
  hmmdefs_subdir=$hmmdefs_dir/G$g
  output_subdir=$output_dir/G$g
  
  # Iterar sobre las subcarpetas 1_1..1_10, 2_1..2_10, etc.
  for h in {1..10}; do

    # Iterar seis veces con diferentes directorios de salida
    for ((k=1; k<=6; k++)); do

      # Construir el nombre del directorio de salida
      results_dir=${output_subdir}/${g}_${h}/${g}_${h}_1
      
	if [ $k -eq 6 ]; then #comparamos si k=6 
      # Ejecutar el comando HERest
       ./HHEd -H ${hmmdefs_subdir}/${g}_${h}/${g}_${h}_${k}/hmmdefs${g}_${h} \
        -H ${macros_subdir}/${g}_${h}/${g}_${h}_${k}/macros${g}_${h} \
        -M ${results_dir} \
        $addGaussians_dir $classes_dir
	
      fi
      
    done
    
  done

done
