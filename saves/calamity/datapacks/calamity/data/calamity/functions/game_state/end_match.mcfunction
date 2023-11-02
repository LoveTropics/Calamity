# Called from: calamity:tick, calamity:player/gg

#>--------------------------------------------------------------------------------------------------
#> Purpose: Reset the map and player states to neutral
#>--------------------------------------------------------------------------------------------------

# Make the announcement
playsound minecraft:event.raid.horn master @a[current_world=true] 136 150 89 999999 0.75

# Make all players spectators!
gamemode spectator @a[current_world=true]

# Remove tags
tag @a[current_world=true] remove VotedForfeit
tag @a[current_world=true] remove ResetTheSpawnItem

# Finish the damn game. We hate waiting around.
function calamity:load/start_end_minigame_countdown

# Update game state
scoreboard players set GameState gameVariable 2
