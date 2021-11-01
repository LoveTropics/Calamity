# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: Tick these functions during the lobby stage
#>--------------------------------------------------------------------------------------------------

# Give recently respawned players respawn status effects
execute as @a[current_world=true,scores={timeSinceDeath=0}] run function calamity:player/give_lobby_effects

# Tick this every second, if the players will it
execute if score StartingMatch gameVariable matches 1 run function calamity:game_state/timer_start_match
