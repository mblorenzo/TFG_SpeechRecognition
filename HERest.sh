#!/bin/bash

# Definir los nombres de las carpetas de entrada y salida
mlf_dir=/media/sf_TFG/Files/Files_train_mlf
mfcc_dir=/media/sf_TFG/Files/Files_train_mfcc
macros_dir=/media/sf_TFG/HMMs
hmmdefs_dir=/media/sf_TFG/HMMs

# Definir el nombre del archivo clase
classes_dir=/media/sf_TFG/Files/classes.txt

# Iterar sobre las subcarpetas G1..G10
for g in {1..10}; do

  mlf_subdir=$mlf_dir/G$g
  mfcc_subdir=$mfcc_dir/G$g
  macros_subdir=$macros_dir/G$g
  hmmdefs_subdir=$hmmdefs_dir/G$g
  
  # Iterar sobre las subcarpetas 1_1..1_10, 2_1..2_10, etc.
  for h in {1..10}; do

    mlf_file=$mlf_subdir/trainMLF${g}_${h}.txt
    mfcc_file=$mfcc_subdir/mfcc_train_${g}_${h}.txt

    # Iterar seis veces con diferentes directorios de salida
    for ((k=1; k<=6; k++)); do
      # Construir el nombre del directorio de salida
      results_dir=${hmmdefs_subdir}/${g}_${h}/${g}_${h}_${k}
      
	if [ $k -eq 1 ]; then #comparamos si k=1 
      # Ejecutar el comando HERest
       ./HERest -I $mlf_file -S $mfcc_file \
        -H ${macros_subdir}/${g}_${h}/macros${g}_${h} \
        -H ${hmmdefs_subdir}/${g}_${h}/hmmdefs${g}_${h} \
        -M ${results_dir} \
        $classes_dir
	else
	  ./HERest -I $mlf_file -S $mfcc_file \
        -H ${macros_subdir}/${g}_${h}/${g}_${h}_$((k-1))/macros${g}_${h} \
        -H ${hmmdefs_subdir}/${g}_${h}/${g}_${h}_$((k-1))/hmmdefs${g}_${h} \
        -M ${results_dir} \
        $classes_dir
      fi
      
    done
    
  done

done
