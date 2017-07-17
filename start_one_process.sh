#!/usr/bin/env bash
file=$1
batch_size=$2
process_id=$3
process_num=${4:-20}
start_pos=${5:-0}
end_pos=${6:-0}

folder=$(dirname $file)
fname=$(basename $file)
fname="${fname%.*}"
batch_folder="${folder}/${fname}_batch_size_${batch_size}"
in_batch_file_pre="${batch_folder}/${fname}_batch"
out_batch_file_pre="${batch_folder}/working/pro_${fname}_batch"
finish_folder="${batch_folder}/finish"
batch_num=$(ls -l $batch_folder | grep "^-" | wc -l)
process_step=$[ ${batch_num}/${process_num} ]
mod_num=$[ ${batch_num} % ${process_num} ]
if ! [ ${mod_num} == 0 ]; then process_step=$[ ${process_step} + 1 ]; fi;

if [ ${end_pos} == 0 ]; then
    end_pos=$[ ${start_pos} + ${batch_num} ]
fi

start_pos=$[ ${start_pos} + ${process_id} ]

for ((i=${start_pos}; i<=${end_pos}; i+=${process_num})); do
    in_file="${in_batch_file_pre}_${i}.txt"
    out_file="${out_batch_file_pre}_${i}.txt"
    finish_file="${finish_folder}/pro_${fname}_batch_${i}.txt"
    if [ ! -f "${in_file}" ]; then
        echo "file ${in_file} not exists, continue."
        continue
    fi
    if [ -f "${finish_file}" ]; then
        echo "finish file ${finish_file} exists, continue."
        continue
    fi
    echo "bash user_one_process.sh ${in_file} ${out_file}"
    bash user_one_process.sh ${in_file} ${out_file}
    finish_flag_file="${finish_folder}/flag_${fname}_batch_${i}.txt"
    if [ -f "${finish_flag_file}" ]; then
        rm $finish_flag_file
        mv ${out_file} ${finish_folder}/
    fi
done
