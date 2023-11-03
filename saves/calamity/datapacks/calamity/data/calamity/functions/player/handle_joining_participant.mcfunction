# Called from: minigame player_participate handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: A participant has just joined the minigame. Let's process them.
#>--------------------------------------------------------------------------------------------------

# The functions below will handle players, no matter what state the game is in.
function #calamity:register_player
tag @s add Playing
spawnpoint @s ~ ~ ~
