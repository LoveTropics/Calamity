# Called from: calamity:build_protection/fix_wall

#>--------------------------------------------------------------------------------------------------
#> Purpose: Fix arena build barriers
#>--------------------------------------------------------------------------------------------------

# This marker will self expire
summon minecraft:area_effect_cloud ~ ~ ~ {Tags: ["tempExplosion", "marker"], Duration: 1}
# Set the markers to map height
data modify entity @e[current_world=true,tag=tempExplosion,limit=1,sort=nearest] Pos[1] set from entity @e[current_world=true,tag=marker,tag=arenaHeight,type=minecraft:area_effect_cloud,limit=1] Pos[1]
# Fix it
execute as @e[current_world=true,tag=tempExplosion,limit=1,sort=nearest] at @s run fill ~ ~ ~ ~ ~-8 ~ minecraft:moving_piston replace #calamity:protection_replaceable
