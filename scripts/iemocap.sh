#!/bin/bash

dataset=iemocap
dataset_dir=data/${dataset}/dataset
ckpt_dir=data/${dataset}/ckpt
do_what=$1

if [ "${do_what}" == "preprocess" ]; then
  python -u preprocess.py --data=${ckpt_dir}/data.pkl \
      --dataset=${dataset} > log/preprocess.${dataset}
elif [ "${do_what}" == "train" ]; then
  python -u train.py --data=${ckpt_dir}/data.pkl \
      --from_begin --device=cpu --epochs=1 \
      --batch_size=2 > log/train.${dataset}
fi
