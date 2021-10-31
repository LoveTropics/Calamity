#---------------------------------------------------------------------------------------------------
# Generate output for items
#---------------------------------------------------------------------------------------------------

# Give the player a score
scoreboard players operation @a[current_world=true,tag=GiveItem] captureScore += ScoreForCaptureResource mapRules
title @a[current_world=true,tag=GiveItem] times 5 30 10
execute as @a[current_world=true,tag=GiveItem,limit=1] run playsound calamity:generator.output master @a[current_world=true] ~ ~ ~

# Give items and send message
execute as @s[tag=Arrow] run give @a[current_world=true,distance=..4,tag=GiveItem] minecraft:arrow 32
execute as @s[tag=Arrow] run title @a[current_world=true,distance=..4,tag=GiveItem] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"item.minecraft.arrow"},{"text":"32"}]}
execute as @s[tag=ArrowOfSlowFalling] run give @a[current_world=true,distance=..4,tag=GiveItem] minecraft:tipped_arrow{Potion: "minecraft:slow_falling"} 32
execute as @s[tag=ArrowOfSlowFalling] run title @a[current_world=true,distance=..4,tag=GiveItem] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"item.minecraft.tipped_arrow.effect.slow_falling"},{"text":"32"}]}
execute as @s[tag=Chain] run give @a[current_world=true,distance=..4,tag=GiveItem] minecraft:chain 24
execute as @s[tag=Chain] run title @a[current_world=true,distance=..4,tag=GiveItem] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.chain"},{"text":"24"}]}
execute as @s[tag=Cobblestone] run give @a[current_world=true,distance=..4,tag=GiveItem] minecraft:cobblestone 9
execute as @s[tag=Cobblestone] run title @a[current_world=true,distance=..4,tag=GiveItem] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.cobblestone"},{"text":"9"}]}
execute as @s[tag=GoldIngot] run give @a[current_world=true,distance=..4,tag=GiveItem] minecraft:gold_ingot 24
execute as @s[tag=GoldIngot] run title @a[current_world=true,distance=..4,tag=GiveItem] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"item.minecraft.gold_ingot"},{"text":"24"}]}
execute as @s[tag=LingeringPotionOfLevitation] run give @a[current_world=true,distance=..4,tag=GiveItem] lingering_potion{display:{Name:'{"translate":"item.minecraft.lingering_potion.effect.levitation"}'},CustomPotionEffects:[{Id:25b,Amplifier:0b,Duration:220,ShowParticles:1b},{Id:28b,Amplifier:0b,Duration:260,ShowParticles:1b}],Potion:"minecraft:empty",CustomPotionColor:16777215} 2
execute as @s[tag=LingeringPotionOfLevitation] run title @a[current_world=true,distance=..4,tag=GiveItem] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"item.minecraft.potion.effect.slow_falling"},{"text":"2"}]}
execute as @s[tag=Log] run give @a[current_world=true,distance=..4,tag=GiveItem] minecraft:oak_log 16
execute as @s[tag=Log] run title @a[current_world=true,distance=..4,tag=GiveItem] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.birch_log"},{"text":"16"}]}
execute as @s[tag=Scaffolding] run give @a[current_world=true,distance=..4,tag=GiveItem] minecraft:scaffolding 16
execute as @s[tag=Scaffolding] run title @a[current_world=true,distance=..4,tag=GiveItem] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.scaffolding"},{"text":"16"}]}
execute as @s[tag=SpectralArrow] run give @a[current_world=true,distance=..4,tag=GiveItem] minecraft:spectral_arrow 32
execute as @s[tag=SpectralArrow] run title @a[current_world=true,distance=..4,tag=GiveItem] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"item.minecraft.spectral_arrow"},{"text":"32"}]}
execute as @s[tag=TNT] run give @a[current_world=true,distance=..4,tag=GiveItem] minecraft:tnt 3
execute as @s[tag=TNT] run title @a[current_world=true,distance=..4,tag=GiveItem] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.tnt"},{"text":"3"}]}
execute as @s[tag=TNT5] run give @a[current_world=true,distance=..4,tag=GiveItem] minecraft:tnt 5
execute as @s[tag=TNT5] run title @a[current_world=true,distance=..4,tag=GiveItem] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.tnt"},{"text":"5"}]}

# Remove GiveItem tag
tag @a[current_world=true,tag=GiveItem] remove GiveItem
