#!/bin/bash

path=/media/sf_TFG/HMMs

for folder in "$path"/*/
 do
   for subfolder in "$folder"/*/
   do
	for file in "$subfolder"*
   	do
            if [ -f "$file" ]
	    then
              cp "$file" "${file}_copy"
            fi  
        done
    done
done
