#!/bin/bash
num_sentences=$(/media/sf_TFG/Augmented_System/phnrec_tscripts/tools/bin/pfile_info /media/sf_TFG/Augmented_System/Files/files_labels/G1/trainlabel1.pfile |  awk -F ' ' '/sentences/{print $1}') #el numero de sentences es el 1
 echo $num_sentences
train_end=$((num_sentences - 1))
qnmultifwd \
ftr1_file="/media/sf_TFG/Augmented_System/Files/files_features/G8/trainfeature1.pfile" \
ftr1_format=pfile \
ftr1_width=39 \
ftr1_norm_file="/media/sf_TFG/Augmented_System/Files/files_normalization/G1/normalization1.norms" \
window_extent=9 \
ftr1_ftr_start=0 \
ftr1_ftr_count=39 \
ftr1_window_offset=0 \
ftr1_window_len=9 \
hardtarget_file="/media/sf_TFG/Augmented_System/Files/files_labels/G1/trainlabel1.pfile" \
hardtarget_format=pfile \
hardtarget_window_offset=0 \
fwd_sent_range="0-${train_end}" \
init_weight_file="/media/sf_TFG/Augmented_System/Files/files_weights/G1/700weights1.weights" \
init_weight_format="matlab" \
mlp_size=351,700,2 \
mlp_output_type=softmax \
debug=1 \
activation_file="/media/sf_TFG/Augmented_System/Files/files_trainPosteriors/G1/trainActivationFile1.pfile" \
activation_format=pfile \
log_file="/media/sf_TFG/Augmented_System/Files/files_trainPosteriors/G1/trainposteriors1.txt"