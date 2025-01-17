# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: Arena-specific actions. Can be used to add detailing, or specific mechanics.
#>--------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
# Make arrows break glass until it shatters
#---------------------------------------------------------------------------------------------------
# Detect that arrow is in a block
tag @e[current_world=true,type=#minecraft:arrows,tag=!inBlock,nbt={inGround: 1b}] add inBlock
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:glass"}}] add inGlass
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:black_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:blue_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:brown_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:cyan_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:gray_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:green_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:light_blue_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:light_gray_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:lime_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:magenta_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:orange_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:pink_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:purple_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:red_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:white_stained_glass"}}] add inStained
tag @e[current_world=true,type=#minecraft:arrows,tag=inBlock,nbt={inBlockState: {Name: "minecraft:yellow_stained_glass"}}] add inStained

# Check the arrow rotation (appare)
execute as @e[current_world=true,tag=inBlock,y_rotation=-90..90] at @s run tp @e[current_world=true,tag=inBlock,limit=1] ~ ~ ~0.05
execute as @e[current_world=true,tag=inBlock,y_rotation=90..-90] at @s run tp @e[current_world=true,tag=inBlock,limit=1] ~ ~ ~-0.05
execute as @e[current_world=true,tag=inBlock,y_rotation=180..0] at @s run tp @e[current_world=true,tag=inBlock,limit=1] ~-0.05 ~ ~
execute as @e[current_world=true,tag=inBlock,y_rotation=0..180] at @s run tp @e[current_world=true,tag=inBlock,limit=1] ~0.05 ~ ~
execute as @e[current_world=true,tag=inBlock,x_rotation=-90..0] at @s run tp @e[current_world=true,tag=inBlock,limit=1] ~ ~-0.05 ~
execute as @e[current_world=true,tag=inBlock,x_rotation=0..90] at @s run tp @e[current_world=true,tag=inBlock,limit=1] ~ ~0.05 ~

# Break glass (last step in durability) and play animations etc.
execute at @e[current_world=true,tag=inGlass] run fill ~ ~ ~ ~ ~ ~ minecraft:air
execute at @e[current_world=true,tag=inGlass] run particle minecraft:block minecraft:glass ~ ~ ~ .35 .35 .35 0.25 20
execute at @e[current_world=true,tag=inGlass] run playsound minecraft:block.glass.break block @a[current_world=true] ~ ~ ~ 0.6
# Consume arrows
kill @e[current_world=true,tag=inGlass]

# Make it seem like something broke because it looks cool.
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:purple_stained_glass run particle minecraft:block minecraft:purple_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:lime_stained_glass run particle minecraft:block minecraft:lime_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:blue_stained_glass run particle minecraft:block minecraft:blue_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:brown_stained_glass run particle minecraft:block minecraft:brown_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:cyan_stained_glass run particle minecraft:block minecraft:cyan_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:green_stained_glass run particle minecraft:block minecraft:green_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:light_blue_stained_glass run particle minecraft:block minecraft:light_blue_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:magenta_stained_glass run particle minecraft:block minecraft:magenta_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:orange_stained_glass run particle minecraft:block minecraft:orange_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:pink_stained_glass run particle minecraft:block minecraft:pink_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:red_stained_glass run particle minecraft:block minecraft:red_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:white_stained_glass run particle minecraft:block minecraft:white_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:gray_stained_glass run particle minecraft:block minecraft:gray_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:light_gray_stained_glass run particle minecraft:block minecraft:light_gray_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:black_stained_glass run particle minecraft:block minecraft:black_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[current_world=true,tag=inStained] if block ~ ~ ~ minecraft:yellow_stained_glass run particle minecraft:block minecraft:yellow_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
# Change color of stained glass ( simulated durability )
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:glass replace minecraft:white_stained_glass
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:white_stained_glass replace minecraft:light_gray_stained_glass
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:light_gray_stained_glass replace minecraft:gray_stained_glass
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:gray_stained_glass replace minecraft:black_stained_glass
# All glass that is not above should just convert straight to black glass.
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:purple_stained_glass
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:lime_stained_glass
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:blue_stained_glass
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:brown_stained_glass
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:cyan_stained_glass
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:green_stained_glass
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:light_blue_stained_glass
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:magenta_stained_glass
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:orange_stained_glass
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:pink_stained_glass
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:red_stained_glass
execute at @e[current_world=true,tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:yellow_stained_glass
# Consume arrows which break glass
kill @e[current_world=true,tag=inStained]
