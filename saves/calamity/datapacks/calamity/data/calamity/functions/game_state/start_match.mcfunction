# Called from: calamity:game_state/timer_start_match

#>--------------------------------------------------------------------------------------------------
#> Purpose: Reset the map and player states to neutral
#>--------------------------------------------------------------------------------------------------

# Set map rules
difficulty normal
gamerule doInsomnia false
gamerule showDeathMessages true
gamerule announceAdvancements false
gamerule doFireTick true

#> Purpose: Establish a SessionID by using game time
execute store result score SessionID gameVariable run time query gametime
scoreboard players operation @a sessionID = SessionID gameVariable

# Make the ore counter visible
function calamity:points/setup_bossbar

#>--------------------------------------------------------------------------------------------------
#> Purpose: Give players items and effects and let them play the game.
#>--------------------------------------------------------------------------------------------------

# Any player on a blue/red team are playing the game
tag @a[team=blue] add Playing
tag @a[team=red] add Playing

# Clear the player's items and effects, give them items, refill their health and hunger
clear @a
effect give @a[tag=Playing] minecraft:regeneration 3 10 false
execute as @a[tag=Playing] run function calamity:player/give_match_effects
gamemode survival @a[tag=Playing]
gamemode spectator @a[tag=!Playing]

# Set the correct scoreboard
scoreboard players operation ░░░░░ displayPoints = OreLeft gameVariable
scoreboard players set Blue displayPoints 0
scoreboard players set Red displayPoints 0
scoreboard objectives setdisplay sidebar displayPoints
scoreboard players set ReadyBlue gameVariable 0
scoreboard players set ReadyRed gameVariable 0
team join blue Blue
team join red Red
team modify fakeRed prefix {"translate":"spacer.right","with":[{"translate":"☒","color":"dark_red"}]}
team modify fakeBlue prefix {"translate":"spacer.right","with":[{"translate":"☒","color":"dark_red"}]}
# Update player triggers
scoreboard players reset * cancelStart
scoreboard players reset * selectTeam
scoreboard players reset * readyTeam
scoreboard players reset * leaveTeam
scoreboard players reset * shuffle
scoreboard players reset * toggleSpectator
scoreboard players enable @a[tag=Playing] gg

# Reset fall damage for everyone, so players that are currently falling won't die after the game has started
effect give @a minecraft:slow_falling 1 0 true
effect clear @a minecraft:slow_falling

# Teleport players to starting location
execute at @e[type=minecraft:area_effect_cloud,name="BlueSpawnpoint"] run teleport @a[team=blue] ~ ~ ~ 0 0
execute at @e[type=minecraft:area_effect_cloud,name="BlueSpawnpoint"] run spawnpoint @a[team=blue] ~ ~ ~
execute at @e[type=minecraft:area_effect_cloud,name="RedSpawnpoint"] run teleport @a[team=red] ~ ~ ~ 0 0
execute at @e[type=minecraft:area_effect_cloud,name="RedSpawnpoint"] run spawnpoint @a[team=red] ~ ~ ~

# Reset the match timer
scoreboard players set MatchTimeInTicks gameVariable 0

# Give starting items
scoreboard players set #arenaAction gameVariable 8
execute as @a[tag=Playing] run function calamity:arena/handler

# Send tellraw BEFORE changing any game modes!
tellraw @a {"translate":"system.message","color":"green","with":[{"translate":"calamity.seekGlory"}]}
tellraw @a {"translate":"calamity.select.respawnItem","color":"gray","with":[{"translate":"calamity.select.respawnItem","italic": true}]}
playsound minecraft:event.raid.horn master @a 136 150 89 999999
playsound calamity:calamity.announcer.match.started master @a 136 150 89 500

# Update game state
scoreboard players set StartingMatch gameVariable 0
scoreboard players set GameState gameVariable 1