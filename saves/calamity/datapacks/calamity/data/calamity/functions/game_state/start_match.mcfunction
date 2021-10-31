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
scoreboard players operation @a[current_world=true] sessionID = SessionID gameVariable

# Make the ore counter visible
function calamity:points/setup_bossbar

#>--------------------------------------------------------------------------------------------------
#> Purpose: Give players items and effects and let them play the game.
#>--------------------------------------------------------------------------------------------------

# Any player on a blue/red team are playing the game
tag @a[current_world=true,team=blue] add Playing
tag @a[current_world=true,team=red] add Playing

# Clear the player's items and effects, give them items, refill their health and hunger
clear @a[current_world=true]
effect give @a[current_world=true,tag=Playing] minecraft:regeneration 3 10 false
execute as @a[current_world=true,tag=Playing] run function calamity:player/give_match_effects
gamemode survival @a[current_world=true,tag=Playing]
gamemode spectator @a[current_world=true,tag=!Playing]

scoreboard players set @a[current_world=true,tag=Playing] streakPoints 0
scoreboard players set @a[current_world=true,tag=Playing] streakLevel 0
scoreboard players set @a[current_world=true,tag=Playing] nextStreakLevel 0

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
scoreboard players enable @a[current_world=true,tag=Playing] gg

# Reset fall damage for everyone, so players that are currently falling won't die after the game has started
effect give @a[current_world=true] minecraft:slow_falling 1 0 true
effect clear @a[current_world=true] minecraft:slow_falling

execute as @a[current_world=true,tag=Playing] run function calamity:player/set_match_spawnpoint

# Reset the match timer
scoreboard players set MatchTimeInTicks gameVariable 0

# Give starting items
scoreboard players set #arenaAction gameVariable 8
execute as @a[current_world=true,tag=Playing] run function calamity:arena/handler

# Arena-specific actions (like removing blocks or entities)
scoreboard players set #arenaAction gameVariable 5
function calamity:arena/handler

# Send tellraw BEFORE changing any game modes!
tellraw @a[current_world=true] {"translate":"system.message","color":"green","with":[{"translate":"calamity.seekGlory"}]}
playsound minecraft:event.raid.horn master @a[current_world=true] 136 150 89 999999
playsound calamity:calamity.announcer.match.started master @a[current_world=true] 136 150 89 500

# Update game state
scoreboard players set StartingMatch gameVariable 0
scoreboard players set GameState gameVariable 1
