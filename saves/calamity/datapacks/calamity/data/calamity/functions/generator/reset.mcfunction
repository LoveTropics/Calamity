# Called from: calamity:generator/handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: The generator is returning to a neutral state.
#>--------------------------------------------------------------------------------------------------

# Remove tag which determine the generator state.
tag @s remove Resetting
tag @s remove Charging

# If a player is nearby, advise them the point is ready to use.
execute as @a[current_world=true,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveMessage
execute as @a[current_world=true,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add GiveMessage
title @a[current_world=true,tag=GiveMessage] actionbar {"translate":"calamity.ready","color":"green"}
tag @a[current_world=true,tag=GiveMessage] remove GiveMessage

execute if entity @s[tag=TeamBlue] run playsound calamity:generator.ready master @a[current_world=true,team=blue] ~ ~-2 ~
execute if entity @s[tag=TeamRed] run playsound calamity:generator.ready master @a[current_world=true,team=red] ~ ~-2 ~

# Update the sign
execute as @s[tag=FacingWest] run data merge block ^ ^ ^3 {Text3: "{\"translate\":\"calamity.generator.sign.ready\"}"}

# Tag which caused the handler to call this function
tag @s remove ReadyToStart
