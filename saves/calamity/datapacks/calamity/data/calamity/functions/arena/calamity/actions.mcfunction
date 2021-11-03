# Called from: calamity:tick
#>--------------------------------------------------------------------------------------------------
#> Purpose: Arena-specific actions. Can be used to add detailing, or specific mechanics.
#>--------------------------------------------------------------------------------------------------

# Play particles for the game table
# Highlight players who fell in this location.
execute as @a[current_world=true,gamemode=adventure,x=135,y=54,z=38,dx=2,dz=2,tag=!HowEmbarassing] run tag @s add HowEmbarassing
execute as @a[current_world=true,tag=HowEmbarassing,tag=!MessageSent] run tellraw @a[current_world=true] {"translate":"calamity.troll","color": "gray","italic": true,"with": [{"selector":"@s"}]}
execute as @a[current_world=true,tag=HowEmbarassing,tag=!MessageSent] run playsound calamity:calamity.laugh master @s 135 54 38 255
tag @a[current_world=true,tag=HowEmbarassing,tag=!MessageSent] add MessageSent
execute as @a[current_world=true,tag=MessageSent] unless entity @s[gamemode=!spectator,x=135,y=54,z=38,dx=2,dz=2] run tag @s remove HowEmbarassing
tag @a[current_world=true,tag=!HowEmbarassing,tag=MessageSent] remove MessageSent
