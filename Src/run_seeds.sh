#!/bin/bash

declare -a action_probs=(0.4 0.6 0.8)
declare -a folder_suffixes=("p_04" "p_06" "p_08")

for i in ${!action_probs[@]}; do
    action_prob=${action_probs[$i]}
    folder_suffix=${folder_suffixes[$i]}

    if [ "$folder_suffix" == "p_08" ]; then
        seeds=$(seq 0 29)
    else
        seeds=$(seq 0 28)
    fi

    for seed in $seeds; do
        python run_SAS.py --env_name='SF_Map' --max_episodes=10000 --algo_name='SAS_NAC' --save_count=9999 --action_prob=$action_prob --folder_suffix=$folder_suffix --seed=$seed
    done
done
