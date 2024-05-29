$action_probs = @(0.4, 0.6, 0.8)
$folder_suffixes = @('p_04', 'p_06', 'p_08')
$seeds = @(0..28)
$seeds_for_p_08 = @(0..29)

for ($i = 0; $i -lt $action_probs.Length; $i++) {
    $action_prob = $action_probs[$i]
    $folder_suffix = $folder_suffixes[$i]

    if ($folder_suffix -eq 'p_08') {
        $seed_list = $seeds_for_p_08
    } else {
        $seed_list = $seeds
    }

    foreach ($seed in $seed_list) {
        python run_SAS.py --env_name='SF_Map' --max_episodes=10000 --algo_name='SAS_NAC' --save_count=9999 --action_prob=$action_prob --folder_suffix=$folder_suffix --seed=$seed
    }
}