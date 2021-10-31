# Called from: calamity:generator/handler

#>--------------------------------------------------------------------------------------------------
#> Generate status effects which buff your team or debuff the other team
#>--------------------------------------------------------------------------------------------------

# Score the player
scoreboard players operation @a[current_world=true,tag=Buff] captureScore += ScoreForCaptureResource mapRules
scoreboard players operation @a[current_world=true,tag=Debuff] captureScore += ScoreForCaptureResource mapRules

# A player has generated effects for their team. Flag their team so we can process them.
execute if entity @a[current_world=true,team=blue,tag=Buff] run tag @a[current_world=true,team=blue] add Buff
execute if entity @a[current_world=true,team=red,tag=Buff] run tag @a[current_world=true,team=red] add Buff
# Sometimes debuffs come with caveats for the attacking team, so let's flag them as well.
execute if entity @a[current_world=true,team=blue,tag=Debuff] run tag @a[current_world=true,team=red] add GiveDebuff
execute if entity @a[current_world=true,team=blue,tag=Debuff] run tag @a[current_world=true,team=blue] remove GiveDebuff
execute if entity @a[current_world=true,team=red,tag=Debuff] run tag @a[current_world=true,team=blue] add GiveDebuff
execute if entity @a[current_world=true,team=red,tag=Debuff] run tag @a[current_world=true,team=red] remove GiveDebuff

# Play success sounds
execute as @a[current_world=true,tag=Buff] run playsound calamity:generator.effect.team player @s
execute as @a[current_world=true,tag=Debuff] run playsound calamity:generator.effect.attack player @s

# Buff
execute as @s[tag=Regeneration] run effect give @a[current_world=true,tag=Buff] minecraft:regeneration 45
execute as @s[tag=Resistance] run effect give @a[current_world=true,tag=Buff] minecraft:resistance 45
execute as @s[tag=Strength] run effect give @a[current_world=true,tag=Buff] minecraft:strength 45
execute as @s[tag=Speed] run effect give @a[current_world=true,tag=Buff] minecraft:speed 45 1
execute as @s[tag=Haste] run effect give @a[current_world=true,tag=Buff] minecraft:haste 45 3
tag @a[current_world=true,tag=Buff] add GiveMessage
tag @a[current_world=true,tag=Buff] remove Buff

# Debuff
execute as @s[tag=MiningFatigue] run effect give @a[current_world=true,tag=GiveDebuff] minecraft:mining_fatigue 45 1
execute as @s[tag=Blindness] run effect give @a[current_world=true,tag=GiveDebuff] minecraft:blindness 45
execute as @s[tag=Blindness] run effect give @a[current_world=true,tag=Debuff] minecraft:glowing 45
tag @a[current_world=true,tag=Debuff] add GiveMessageAttack
tag @a[current_world=true,tag=Debuff] remove Debuff
tag @a[current_world=true,tag=GiveDebuff] add GiveMessageDebuffed
tag @a[current_world=true,tag=GiveDebuff] remove GiveDebuff

# Buff messages
execute as @s[tag=Haste] run tellraw @a[current_world=true,tag=GiveMessage] {"translate":"system.message","color": "green","with":[{"translate":"calamity.generator.output.effect.given.level","with":[{"translate":"effect.minecraft.haste","color": "white"},{"translate":"potion.potency.3","color": "white"},{"text":"45","color": "white"}]}]}
execute as @s[tag=Regeneration] run tellraw @a[current_world=true,tag=GiveMessage] {"translate":"system.message","color": "green","with":[{"translate":"calamity.generator.output.effect.given","with":[{"translate":"effect.minecraft.regeneration","color": "white"},{"text":"45","color": "white"}]}]}
execute as @s[tag=Resistance] run tellraw @a[current_world=true,tag=GiveMessage] {"translate":"system.message","color": "green","with":[{"translate":"calamity.generator.output.effect.given","with":[{"translate":"effect.minecraft.resistance","color": "white"},{"translate":"potion.potency.1","color": "white"},{"text":"45","color": "white"}]}]}
execute as @s[tag=Speed] run tellraw @a[current_world=true,tag=GiveMessage] {"translate":"system.message","color": "green","with":[{"translate":"calamity.generator.output.effect.given.level","with":[{"translate":"effect.minecraft.speed","color": "white"},{"translate":"potion.potency.1","color": "white"},{"text":"45","color": "white"}]}]}
execute as @s[tag=Strength] run tellraw @a[current_world=true,tag=GiveMessage] {"translate":"system.message","color": "green","with":[{"translate":"calamity.generator.output.effect.given","with":[{"translate":"effect.minecraft.strength","color": "white"},{"text":"45","color": "white"}]}]}

# Debuff messages
execute as @s[tag=Blindness] run tellraw @a[current_world=true,tag=GiveMessageAttack] {"translate":"system.message","color": "green","with":[{"translate":"calamity.generator.output.effect.given","with":[{"translate":"effect.minecraft.glowing","color": "white"},{"text":"30","color": "white"}]}]}
execute as @s[tag=Blindness] run tellraw @a[current_world=true,tag=GiveMessageDebuffed] {"translate":"system.message","color": "green","with":[{"translate":"calamity.generator.output.effect.given.level","with":[{"translate":"effect.minecraft.blindness","color": "white"},{"text":"30","color": "white"}]}]}
execute as @s[tag=MiningFatigue] run tellraw @a[current_world=true,tag=GiveMessageAttack] {"translate":"system.message","color": "green","with":[{"translate":"calamity.generator.output.effect.sent.level","with":[{"translate":"effect.minecraft.mining_fatigue","color": "white"},{"translate":"potion.potency.1","color": "white"},{"text":"45","color": "white"}]}]}
execute as @s[tag=MiningFatigue] run tellraw @a[current_world=true,tag=GiveMessageDebuffed] {"translate":"system.message","color": "green","with":[{"translate":"calamity.generator.output.effect.given.level","with":[{"translate":"effect.minecraft.mining_fatigue","color": "white"},{"translate":"potion.potency.1","color": "white"},{"text":"45","color": "white"}]}]}

# Remove message tags
tag @a[current_world=true,tag=GiveMessageAttack] remove GiveMessageAttack
tag @a[current_world=true,tag=GiveMessageDebuffed] remove GiveMessageDebuffed
