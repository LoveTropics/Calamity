# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: Tick these functions during the post-game
#>--------------------------------------------------------------------------------------------------

# Players used trigger reset, let's process what they did.
scoreboard players set @a[current_world=true,scores={reset=..-1}] reset 0
scoreboard players enable @a[current_world=true,scores={reset=0}] reset
execute as @a[current_world=true,scores={reset=1..}] at @s run function calamity:game_state/reset
