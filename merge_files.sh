#!/usr/bin/env bash
# usage:
# ./merge_batch_files.sh file batch_size
file=$1
batch_size=$2

folder=$(dirname $file)
fname_full=$(basename $file)
fname="${fname_full%.*}"
batch_folder="${folder}/${fname}_batch_size_${batch_size}"
finish_folder="${batch_folder}/finish"
file_num=$(ls -l $finish_folder | grep "^-" | wc -l)
echo "find ${file_num} files..."

merge_finish_file="${folder}/processed_${fname_full}"
echo "merge files into processed_${fname_full}"

for ((i=0; i<${file_num}; i++)); do
    finish_file="${finish_folder}/pro_${fname}_batch_${i}.txt"
    echo "cat ${finish_file} >> ${merge_finish_file}"
    cat ${finish_file} >> ${merge_finish_file}
done