$action_probs = @(0.2, 0.4, 0.6, 0.8)
$folder_suffixes = @('p_02', 'p_04', 'p_06', 'p_08')
$algorithms = @('SAS_Q', 'SAS_NAC', 'SAS_PGQV')
$seeds_start = 1000

function Get-RandomValueFromRange($min, $max) {
    return [math]::Round((Get-Random -Minimum $min -Maximum $max), 4)
}

$seed_counter = $seeds_start

foreach ($algo in $algorithms) {
    for ($i = 0; $i -lt $action_probs.Length; $i++) {
        $action_prob = $action_probs[$i]
        $folder_suffix = $folder_suffixes[$i]

        for ($run = 0; $run -lt 30; $run++) {
            $seed = $seed_counter
            $seed_counter++

            # Sample hyperparameters
            $batch_size = Get-Random -InputObject @(8, 16, 32)
            $state_lr = Get-RandomValueFromRange 0.0001 0.01
            $actor_lr = Get-RandomValueFromRange 0.0001 0.01
            $exp = Get-RandomValueFromRange 0.05 0.15

            python run_SAS.py --env_name='SF_Map' --max_episodes=10000 --algo_name=$algo --save_count=9999 --action_prob=$action_prob --folder_suffix=$folder_suffix --seed=$seed --batch_size=$batch_size --state_lr=$state_lr --actor_lr=$actor_lr --exp=$exp
        }
    }
}
