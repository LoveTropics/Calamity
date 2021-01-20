# Called from: #minecraft:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Always tick these functions. Calls main game handlers. Sometimes a function is a single
#   line.
#---------------------------------------------------------------------------------------------------
# Any function here usually has it's own handling for lobby time and match time.

# Let's first check to see if any online player has left the game
# If a player fails the initial check in this function, they are no longer registered.
execute as @a[scores={leaveGame=1..}] at @s run function moesh:player/left_game

# The functions below will handle players, no matter what state the game is in.
execute as @a[tag=!Registered] at @s run function #moesh:register_player
execute as @a[tag=!Registered] run tellraw @s {"translate":"%s Calamity by Moesh","color":"light_purple","with":[{"text":">>>","color":"white"}]}
tag @a[tag=!Registered] add Registered


tag @a[nbt={Health:0.0f}] add Dead 
tag @a[tag=Dead] add RefillItems
tag @a[tag=RefillItems,tag=Dead] remove Dead


give @a[tag=RefillItems] minecraft:iron_axe{Damage:240,repairCost:"99999",Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]} 1
tag @a remove RefillItems


# Convert or kill items as needed
execute as @e[type=item,nbt={Item:{id:"minecraft:end_stone"}}] run data merge entity @s {Item:{id:"minecraft:cobblestone"}}
#execute as @e[type=item,nbt={Item:{id:"minecraft:iron_ore"}}] run data merge entity @s {Item:{id:"minecraft:iron_ingot"}}
kill @e[type=item,nbt={Item:{id:"minecraft:redstone_lamp"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:prismarine_crystals"}}]

# Feed hungry players, this game isn't about fighting hunger.
effect give @a[scores={food=..19}] minecraft:saturation 1 0 false
effect clear @a[scores={food=20}] minecraft:saturation

## Kill players who are in the void
#execute as @a[tag=Playing] at @s if block ~ 69 ~ air run effect give @s minecraft:slowness 1 7
#execute as @a[tag=Playing] at @s if block ~ 69 ~ air run effect give @s minecraft:weakness 1 7
#execute as @a[tag=Playing] at @s if block ~ 69 ~ air run effect give @s minecraft:mining_fatigue 1 7
#execute as @a[tag=Playing] at @s if block ~ 69 ~ air run title @s subtitle {"translate": "Out of bounds!","color":"red"} 
#execute as @a[tag=Playing] at @s if block ~ 69 ~ air run title @s title {"translate": ""} 

# Determine game state, if necessary
function moesh:game_state/handler
# What if a player selects a team using a trigger?
execute if score GameState gameVariable matches 0 run function moesh:player/trigger_join_team

# Run the functions listed in #moesh:tick_match if a match is running
execute if score GameState gameVariable matches 1 run function #moesh:tick_match
