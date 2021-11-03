# Called from: nowhere

#>--------------------------------------------------------------------------------------------------
#> Purpose: We want to start a new match. Make it so.
#>--------------------------------------------------------------------------------------------------

# Here is where I make my comment about adjusting function maps for Love Tropics. Pretty much all
#   work I put into player handling needs to be pulled out in favor of a system that works much
#   better with mods. Functions and mods haven't historically worked well together, although there
#   a few attempts back in 2014. There was a mod for the RACE FOR THE WOOL, or R/MCT (RMCT), which
#   did this handling so very well. Calamity's messaging system is based on the styling they
#   choose. Very cool stuff. This function starts the map. It only exists because it's a hacky way
#   to start up the project. The map state needs to get updates, and then the intro value set, so
#   it can start counting down.

# Update
scoreboard players set StartingMatch gameVariable 1

# Start the timer from the beginning
scoreboard players operation TimeInTicks gameVariable = TimeToStartMatch gameVariable
