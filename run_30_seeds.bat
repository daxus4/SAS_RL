@echo off
setlocal enabledelayedexpansion

set "command=PYTHON_PATH RUN_SAS_PATH --max_episodes 20000 --algo_name SAS_NAC --folder_suffix p_08 --save_count 19999 --action_prob 0.8 --seed"

for /L %%i in (1,1,20) do (
    set /A seed=1 + %%i
    echo Running iteration %%i with seed !seed!
    %command% !seed!
)

endlocal