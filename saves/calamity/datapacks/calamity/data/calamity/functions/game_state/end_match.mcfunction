# Called from: calamity:tick, calamity:player/gg

#>--------------------------------------------------------------------------------------------------
#> Purpose: Reset the map and player states to neutral
#>--------------------------------------------------------------------------------------------------

# Make the announcement
playsound minecraft:event.raid.horn master @a[current_world=true] 136 150 89 999999 0.75

# Make all players spectators!
gamemode spectator @a[current_world=true]

# The match has ended, let's update the SessionID so players are properly handled
execute store result score SessionID gameVariable run time query gametime
scoreboard players operation @a[current_world=true] sessionID = SessionID gameVariable

# Update player triggers
scoreboard players reset @a[current_world=true] resetSpawnItem
scoreboard players reset @a[current_world=true] gg
scoreboard players reset @a[current_world=true] reset
scoreboard players enable @a[current_world=true] reset

# Remove tags
tag @a[current_world=true] remove VotedForfeit
tag @a[current_world=true] remove ResetTheSpawnItem

# Allow players to reset the map themselves
tellraw @a[current_world=true] {"translate":"system.message","with": [{"translate":"calamity.reset.map","color":"green","with":[{"text":"/trigger reset","color":"blue","underlined": true,"clickEvent":{"action":"suggest_command","value":"/trigger reset"},"hoverEvent":{"action":"show_text","value":{"translate":"calamity.hover.sendTriggerCommand"}}}]}]}

# Tell the minigame system that the game has ended
game finish

# Update game state
scoreboard players set GameState gameVariable 2
