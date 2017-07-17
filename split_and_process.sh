#!/usr/bin/env bash
# usage:
# ./split_and_process.sh file batch_size process_num start_pos end_pos
# path of the file need to be processed.
file=$1
# number of iterms in one split file.
batch_size=$2
# number of prcesses in parallel
process_num=${3:-20}
# batch file id start to process
start_pos=${4:-0}
# batch file id stop process
end_pos=${5:-0}

# split file in to multiple batch file
python generate_split_batch.py --file ${file} --batch_size ${batch_size}

# loop to create multiple process to process data in parallel, screen is needed.
for ((i=0; i<${process_num}; i++)); do
    echo "bash start_one_process.sh ${file} ${batch_size} ${i} ${process_num} ${start_pos} ${end_pos}"
    screen -dmS s${i} bash -c "bash start_one_process.sh ${file} ${batch_size} ${i} ${process_num} ${start_pos} ${end_pos};bash -l;"
    # sleep 10s
done

echo "after finish process in parallel, using \'merge_batch_files.sh\' to merge batch files in to one file."