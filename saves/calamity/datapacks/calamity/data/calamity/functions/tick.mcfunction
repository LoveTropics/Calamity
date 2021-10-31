# Called from: minigame tick handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: Calamity's entry point. This function ticks every second, and handles top-level logic
#>   for the game. Sometimes commands which have no home also find their way to this function.
#>--------------------------------------------------------------------------------------------------

# Feed hungry players, this game isn't about fighting hunger.
effect give @a[current_world=true,scores={food=..19}] minecraft:saturation 1 0 false
effect clear @a[current_world=true,scores={food=20}] minecraft:saturation

# Void looping protection must be run frequently.
execute as @a[current_world=true,tag=Spawnpoint] unless block ~ ~ ~ minecraft:air run setblock ~ ~ ~ minecraft:air
execute as @a[current_world=true,tag=Spawnpoint] unless block ~ ~1 ~ minecraft:air run setblock ~ ~1 ~ minecraft:air
execute if score GameState gameVariable matches 0 as @a[current_world=true,scores={timeSinceDeath=0}] unless entity @e[current_world=true,type=minecraft:area_effect_cloud,tag=Spawnpoint,distance=..2] at @s run function calamity:player/set_to_lobby_mode
execute if score GameState gameVariable matches 1 as @a[current_world=true,scores={timeSinceDeath=0}] unless entity @e[current_world=true,type=minecraft:area_effect_cloud,tag=Spawnpoint,distance=..2] at @s run function calamity:player/set_match_spawnpoint

# Some arenas may have special effects or other easter egg cases. Always tick these.
scoreboard players set #arenaAction gameVariable 2
function calamity:arena/handler

# Determine game state, if necessary
execute if score GameState gameVariable matches 0 run function calamity:game_state/tick_lobby
execute if score GameState gameVariable matches 1 run function calamity:game_state/tick_match
execute if score GameState gameVariable matches 2 run function calamity:game_state/tick_post_game
