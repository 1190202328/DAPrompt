#!/bin/bash

# custom config
DATA=/nfs/ofs-902-1/object-detection/jiangjing/datasets/office_home # you may change your path to dataset here
TRAINER=DAPL

DATASET=$1 # name of the dataset
CFG=$2     # config file
T=$3       # temperature
TAU=$4     # pseudo label threshold
U=$5       # coefficient for loss_u
NAME=$6    # job name
SOURCE=$7
TARGET=$8

SEED=666666
DIR=output/${DATASET}/${TRAINER}/${CFG}/${T}_${TAU}_${U}_${NAME}/${SOURCE}-${TARGET}/seed_${SEED}

CUDA_VISIBLE_DEVICES=0 /home/luban/apps/miniconda/miniconda/envs/torch1101/bin/python train.py \
  --source-domains ${SOURCE} \
  --target-domains ${TARGET} \
  --root ${DATA} \
  --seed ${SEED} \
  --trainer ${TRAINER} \
  --dataset-config-file configs/datasets/${DATASET}.yaml \
  --config-file configs/trainers/${TRAINER}/${CFG}.yaml \
  --model-dir ${DIR} \
  --output-dir ${DIR} \
  --eval-only
