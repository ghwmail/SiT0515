#!/bin/bash
export CUDA_VISIBLE_DEVICES=3,4,5

read -p "Are you sure you want to proceed? (y/n) " confirm
if [ "$confirm" = "y" ]; then
    (
        nproc_per_node=3
        master_port=$(($RANDOM + 11451))
        
        torchrun \
        --master_port=$master_port \
        --nproc_per_node=$nproc_per_node \
        ./src/pretrain/main_mae.py \

    ) &
else
    echo "Task cancelled."
fi