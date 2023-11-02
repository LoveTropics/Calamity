# Called from: minigame player_participate handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: A participant has just joined the minigame. Let's process them.
#>--------------------------------------------------------------------------------------------------

# The functions below will handle players, no matter what state the game is in.
function #calamity:register_player
function calamity:player/set_to_lobby_mode
scoreboard players set @a[current_world=true,scores={leftGame=1..}] leftGame 0
