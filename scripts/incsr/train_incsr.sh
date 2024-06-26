#!/bin/bash
export CUDA_VISIBLE_DEVICES=1,3,4,5

    nproc_per_node=$1
    master_port=$(($RANDOM + 11451))

    torchrun \
    --master_port=$master_port \
    --nproc_per_node=$nproc_per_node \
    ./src/incsr/main_incsr.py --dataset $2 --config $3 \