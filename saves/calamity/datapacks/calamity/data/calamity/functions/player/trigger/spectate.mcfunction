# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: A player wants to change to spectator game mode. Let them. We don't care what game mode
#   the player is in. It only matters if they are on a team or not on a team.
#>--------------------------------------------------------------------------------------------------

# Since this trigger is a toggle and not a specific use like selectTeam, we must add a little bit of
#   tag handling. We have one scoreboard trigger to access this function, and then we will check the
#   current gamemode of the player. This will determine what part of this function runs.

# A player in adventure mode wants to change gamemode to spectator
tag @a[current_world=true,gamemode=adventure,scores={toggleSpectator=1..}] add SetToSpectatorMode
gamerule sendCommandFeedback true
gamemode spectator @a[current_world=true,tag=SetToSpectatorMode]
gamerule sendCommandFeedback false
scoreboard players set @a[current_world=true,tag=SetToSpectatorMode] toggleSpectator 0
tag @a[current_world=true,tag=SetToSpectatorMode] remove SetToSpectatorMode

# A player in spectator mode wants to change gamemode to adventure
tag @a[current_world=true,gamemode=spectator,scores={toggleSpectator=1..}] add SetToAdventureMode
execute as @a[current_world=true,tag=SetToAdventureMode] run function calamity:player/set_to_lobby_mode
scoreboard players set @a[current_world=true,tag=SetToAdventureMode] toggleSpectator 0
tag @a[current_world=true,tag=SetToAdventureMode] remove SetToAdventureMode

# Always reset trigger if the score is not zero.
scoreboard players set @a[current_world=true,scores={toggleSpectator=..-1}] toggleSpectator 0
scoreboard players set @a[current_world=true,scores={toggleSpectator=1..}] toggleSpectator 0

# Always enable the trigger
scoreboard players enable @a[current_world=true] toggleSpectator
