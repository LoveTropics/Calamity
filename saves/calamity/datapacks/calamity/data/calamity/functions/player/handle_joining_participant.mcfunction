# Called from: minigame player_participate handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: A participant has just joined the minigame. Let's process them.
#>--------------------------------------------------------------------------------------------------

# When a player exists and the scoreboards have been reset, there can be desync. Players will have
#   no sessionID, so let's always add 0 to ensure they exist on the scoreboard.
scoreboard players add @a[current_world=true] sessionID 0

# This player has no sessionID. We can assume they have been on the map before, but scoreboards
#   have been reset since then. Calamity often hard resets data, but this doesn't apply to offline
#   players.
execute as @a[current_world=true] unless score @s sessionID = SessionID gameVariable run tag @s add Registered

# The functions below will handle players, no matter what state the game is in.
execute as @a[current_world=true,tag=!Registered] at @s run function #calamity:register_player
execute as @a[current_world=true,tag=!Registered] run function calamity:player/set_to_lobby_mode
scoreboard players set @a[current_world=true,scores={leftGame=1..}] leftGame 0
tag @a[current_world=true,tag=!Registered] add Registered
