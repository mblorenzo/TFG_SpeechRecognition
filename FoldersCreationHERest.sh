#!/bin/bash
for i in {1..10}; do
    for j in {1..10}; do
        for k in {1..6}; do
            mkdir /media/sf_TFG/HMMs/G${i}/${i}_${j}/${i}_${j}_${k}
        done
    done
done