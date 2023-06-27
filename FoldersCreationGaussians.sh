#!/bin/bash
for i in {1..10}; do
  mkdir /media/sf_TFG/HMMs_gaussians/G${i}
    for j in {1..10}; do
	mkdir /media/sf_TFG/HMMs_gaussians/G${i}/${i}_${j}
        for k in {1..40}; do
            mkdir /media/sf_TFG/HMMs_gaussians/G${i}/${i}_${j}/${i}_${j}_${k}
        done
    done
done