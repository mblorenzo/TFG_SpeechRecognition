#!/bin/bash

# Definir los nombres de las carpetas de entrada y salida

macros_dir=/media/sf_TFG/HMMs_gaussians
hmmdefs_dir=/media/sf_TFG/HMMs_gaussians
mfcc_dir=/media/sf_TFG/Files/Files_test_mfcc

output_dir=/media/sf_TFG/Recognition

# Definir el nombre de los archivos

wdnet_dir=/media/sf_TFG/Files/wdnet.txt
dict_dir=/media/sf_TFG/Files/dict.txt
classes_dir=/media/sf_TFG/Files/classes.txt

# Iterar sobre las subcarpetas G1..G10
for g in {1..10}; do

  echo "grupo G$g"

  macros_subdir=$macros_dir/G$g
  hmmdefs_subdir=$hmmdefs_dir/G$g
  mfcc_subdir=$mfcc_dir/G$g
  output_subdir=$output_dir/G$g
  
  # Iterar sobre las subcarpetas 1_1..1_10, 2_1..2_10, etc.
  for h in {1..10}; do
    
    echo "subgrupo H$h"

    mfcc_file=$mfcc_subdir/mfcc_test_${g}_${h}.txt
    echo $mfcc_file

    for i in {2..41}; do
	
    echo "Gaussiana $i del grupo G$g del subgrupo H$h"

      # Nombre del directorio de salida
      results_dir=${output_subdir}/${g}_${h}/${g}_${h}_${i}
	echo $results_dir
      
	./HVite -H ${macros_subdir}/${g}_${h}/${g}_${h}_$((i-1))/macros${g}_${h} \
		  -H ${hmmdefs_subdir}/${g}_${h}/${g}_${h}_$((i-1))/hmmdefs${g}_${h} \
		  -S $mfcc_file -l '*' \
		  -i ${results_dir}/recout${g}_${h}_${i}.mlf \
		  -w $wdnet_dir $dict_dir $classes_dir 

#echo "./HVite -H ${macros_subdir}/${g}_${h}/${g}_${h}_$((i-1))/macros${g}_${h} -H ${hmmdefs_subdir}/${g}_${h}/${g}_${h}_$((i-1))/hmmdefs${g}_${h} -S $mfcc_file -l '*' -i ${results_dir}/recout${g}_${h}_${i}.mlf -w $wdnet_dir $dict_dir $classes_dir" >> ejecucionHVite.txt
      
     done

  done

done
