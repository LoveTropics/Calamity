# Called from: minigame player_spectate handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: A spectator has just joined the minigame. Let's process them.
#>--------------------------------------------------------------------------------------------------

# The functions below will handle players, no matter what state the game is in.
function #calamity:register_player
scoreboard players set @a[current_world=true,scores={leftGame=1..}] leftGame 0
