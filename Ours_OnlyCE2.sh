BW=2
for EPSILON in 0.05 0.1 0.2
do
    for seed in 0 1 2
    do
        train_id="${BW}_${EPSILON}_${seed}"
        result_dir="./results/$train_id"
        mkdir -p $result_dir
        python -u train_pd_layers.py \
            --epsilon_out $EPSILON \
            --model resnet20q \
            --dataset cifar10 \
            --train_split train \
            --lr 0.001 \
            --lr_dual 0.01 \
            --lr_decay "50,75,90" \
            --epochs 100 \
            --optimizer adam \
            --weight-decay 0.0 \
            --results-dir $result_dir \
            --bit_width_list "${BW}, 32" \
            --wandb_log \
            --project QS_Ours_OnlyCE \
            --seed ${seed}
    done
done



