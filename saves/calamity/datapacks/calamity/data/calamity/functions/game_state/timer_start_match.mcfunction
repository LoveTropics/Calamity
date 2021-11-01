# Called from: calamity:trigger_start_match

#>--------------------------------------------------------------------------------------------------
#> Purpose: TimeInTicks from 15 seconds and then start the match.
#>--------------------------------------------------------------------------------------------------

# Load variables into the math function and run it.
scoreboard players operation #InSeconds gameVariable = TimeInTicks gameVariable
scoreboard players operation #Every20Ticks gameVariable = TimeInTicks gameVariable
function calamity:math/divide_by_twenty

# When #Every20Ticks equals 0, a second has passed. Play a sound.
execute if score #Every20Ticks gameVariable matches 0 run playsound minecraft:block.note_block.bit master @a[current_world=true] 136 150 89 999999 0.7

# Check our progress. Announce to the player when enough time has passed.
# 15, 10, and 5 seconds
execute if score TimeInTicks gameVariable matches 300 run tellraw @a[current_world=true] {"translate":"system.message","color":"green","with":[{"translate":"calamity.startMatch.countdown","with":[{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}]}
execute if score TimeInTicks gameVariable matches 300 run playsound calamity:calamity.announcer.match.countdown.start master @a[current_world=true] 136 150 89 500
execute if score TimeInTicks gameVariable matches 200 run tellraw @a[current_world=true] {"translate":"system.message","color":"green","with":[{"translate":"calamity.startMatch.countdown","with":[{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}]}
execute if score TimeInTicks gameVariable matches 100 run tellraw @a[current_world=true] {"translate":"system.message","color":"green","with":[{"translate":"calamity.startMatch.countdown","with":[{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}]}
execute if score TimeInTicks gameVariable matches 100 run playsound calamity:calamity.announcer.countdown.5 master @a[current_world=true] 136 150 89 500
# 4 seconds to 1 seconds...
execute if score TimeInTicks gameVariable matches 80 run tellraw @a[current_world=true] {"translate":"system.message","color":"green","with":[{"translate":"calamity.startMatch.countdown.lastFiveSeconds","with":[{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}]}
execute if score TimeInTicks gameVariable matches 80 run playsound calamity:calamity.announcer.countdown.4 master @a[current_world=true] 136 150 89 500
execute if score TimeInTicks gameVariable matches 60 run tellraw @a[current_world=true] {"translate":"system.message","color":"green","with":[{"translate":"calamity.startMatch.countdown.lastFiveSeconds","with":[{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}]}
execute if score TimeInTicks gameVariable matches 60 run playsound calamity:calamity.announcer.countdown.3 master @a[current_world=true] 136 150 89 500
execute if score TimeInTicks gameVariable matches 40 run tellraw @a[current_world=true] {"translate":"system.message","color":"green","with":[{"translate":"calamity.startMatch.countdown.lastFiveSeconds","with":[{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}]}
execute if score TimeInTicks gameVariable matches 40 run playsound calamity:calamity.announcer.countdown.2 master @a[current_world=true] 136 150 89 500
execute if score TimeInTicks gameVariable matches 20 run tellraw @a[current_world=true] {"translate":"system.message","color":"green","with":[{"translate":"calamity.startMatch.countdown.lastFiveSeconds","with":[{"score":{"name":"#InSeconds","objective":"gameVariable"},"color":"white"}]}]}
execute if score TimeInTicks gameVariable matches 20 run playsound calamity:calamity.announcer.countdown.1 master @a[current_world=true] 136 150 89 500

execute if score TimeInTicks gameVariable matches 0 run function calamity:game_state/start_match

# This function is run every tick if this is true
execute if score TimeInTicks gameVariable matches 1.. run scoreboard players remove TimeInTicks gameVariable 1
