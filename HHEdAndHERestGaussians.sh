#!/bin/bash

# Definir los nombres de las carpetas de entrada y salida
mlf_dir=/media/sf_TFG/Files/Files_train_mlf
mfcc_dir=/media/sf_TFG/Files/Files_train_mfcc
macros_dir=/media/sf_TFG/HMMs_gaussians
hmmdefs_dir=/media/sf_TFG/HMMs_gaussians

# Definir el nombre del archivo clase
classes_dir=/media/sf_TFG/Files/classes.txt
addGaussians_dir=/media/sf_TFG/Files/addGaussians.txt


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

	
    for i in {1..40}; do

	 # Iterar seis veces con mismos directorios de salida
       for ((k=1; k<=6; k++)); do

       # Construir el nombre del directorio de salida
       results_dirHERest=${hmmdefs_subdir}/${g}_${h}/${g}_${h}_${i}

	  ./HERest -I $mlf_file -S $mfcc_file \
        -H ${macros_subdir}/${g}_${h}/${g}_${h}_${i}/macros${g}_${h} \
        -H ${hmmdefs_subdir}/${g}_${h}/${g}_${h}_${i}/hmmdefs${g}_${h} \
        -M ${results_dirHERest} \
        $classes_dir

       done
	 
       if [ $i -ne 40 ]; then
       results_dirHHEd=${hmmdefs_subdir}/${g}_${h}/${g}_${h}_$((i+1))
       ./HHEd -H ${hmmdefs_subdir}/${g}_${h}/${g}_${h}_${i}/hmmdefs${g}_${h} \
         -H ${macros_subdir}/${g}_${h}/${g}_${h}_${i}/macros${g}_${h} \
         -M ${results_dirHHEd} \
         $addGaussians_dir $classes_dir
       fi

    done
      
  done

done
