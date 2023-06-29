#!/bin/bash


units=(100 200 300 400 500 600 700 800 900 1000)

num_sentences=$(/home/user/maria/Augmented_System/phnrec_tscripts/tools/bin/pfile_info /home/user/maria/Augmented_System/Files/files_labels/trainlabel3.pfile |  awk -F ' ' '/sentences/{print $1}') #el numero de sentences es el 1
 echo $num_sentences

# Calcular el 12% redondeado hacia arriba. Funcion printf %.0f lo hace
#cv_range=$(printf "%.0f" $(echo "($num_sentences * 0.12 + 0.5)" | bc))
cv_range=$(awk -v num_sentences="$num_sentences" 'BEGIN { rounded = int(num_sentences * 0.12 + 0.5); print rounded }')

# Calcular el rango de entrenamiento
train_start=$((cv_range + 1))
train_end=$((num_sentences - 1))

for unit in "${units[@]}"; do
	qnmultitrn \
	ftr1_file="/home/user/maria/Augmented_System/Files/files_features/trainfeature3.pfile" \
	ftr1_format=pfile \
	ftr1_width=39 \
	ftr1_norm_file="/home/user/maria/Augmented_System/Files/files_normalization/normalization3.norms" \
	window_extent=9 \
	ftr1_ftr_start=0 \
	ftr1_ftr_count=39 \
	ftr1_window_offset=0 \
	ftr1_window_len=9 \
	hardtarget_file="/home/user/maria/Augmented_System/Files/files_labels/trainlabel3.pfile"  \
	hardtarget_format=pfile \
	hardtarget_window_offset=0 \
	train_sent_range="${train_start}-${train_end}" \
	cv_sent_range="0-${cv_range}" \
	train_cache_frames=30000 \
	train_cache_seed=0 \
	init_weight_file= \
	out_weight_file="/home/user/maria/Augmented_System/Files/files_weights/${unit}weights3.weights"  \
	mlp_size=351,"$unit",2 \
	mlp_output_type=softmax \
	debug=1 \
	log_file="/home/user/maria/Augmented_System/Files/files_results/${unit}result3.txt"
done