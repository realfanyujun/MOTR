#!/usr/bin/env bash

# ------------------------------------------------------------------------
# Copyright (c) 2021 megvii-model. All Rights Reserved.
# ------------------------------------------------------------------------
# Modified from Deformable DETR (https://github.com/fundamentalvision/Deformable-DETR)
# Copyright (c) 2020 SenseTime. All Rights Reserved.
# ------------------------------------------------------------------------


# for MOT17

#PRETRAIN=r50_deformable_detr_plus_iterative_bbox_refinement-checkpoint.pth
EXP_DIR=output
python3 main.py \
    --meta_arch motr \
    --use_checkpoint \
    --dataset_file uavdt \
    --epoch 30 \
    --with_box_refine \
    --lr_drop 10 \
    --lr 2e-4 \
    --lr_backbone 2e-5 \
    --output_dir ${EXP_DIR} \
    --batch_size 2 \
    --sample_mode 'random_interval' \
    --sample_interval 10 \
    --sampler_steps 5 9 15 \
    --sampler_lengths 2 3 4 5 \
    --update_query_pos \
    --merger_dropout 0 \
    --dropout 0 \
    --random_drop 0.1 \
    --fp_ratio 0.3 \
    --query_interaction_layer 'QIM' \
    --extra_track_attn \
    --data_txt_path_train /home/vipuser/UAVDT/GT/train \
    --data_txt_path_val /home/vipuser/UAVDT/GT/val \
    2>&1 | tee ${EXP_DIR}/output.log
