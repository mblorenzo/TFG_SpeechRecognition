#!/bin/bash

# Definir los nombres de las carpetas de entrada y salida

mlf_dir=/media/sf_TFG/Files/Files_test_mlf
recout_dir=/media/sf_TFG/Recognition

output_dir=/media/sf_TFG/Results

# Definir el nombre de los archivos
classes_dir=/media/sf_TFG/Files/classes.txt

# Iterar sobre las subcarpetas G1..G10
for g in {1..10}; do

  echo "grupo G$g"

  recout_subdir=$recout_dir/G$g
  output_subdir=$output_dir/G$g

  echo $recout_subdir
  
    for i in {1..41}; do
	
    echo $i

	./HResults -p -I $mlf_dir/testMLFG${g}.txt \
	  $classes_dir \
	  ${recout_subdir}/recoutG${g}_${i}.mlf >> ${output_subdir}/resultsG${g}_${i}.txt 
      
     done

done
