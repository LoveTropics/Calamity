# Called from: #calamity:load

#>--------------------------------------------------------------------------------------------------
#> Purpose: We're reloading the map, reset all of the player's tags
#>--------------------------------------------------------------------------------------------------

tag @a[current_world=true] remove ForfeitTriggered
tag @a[current_world=true] remove GiveEffects
tag @a[current_world=true] remove GiveEnchant
tag @a[current_world=true] remove GiveMessage
tag @a[current_world=true] remove GiveMessageAttack
tag @a[current_world=true] remove GiveMessageAttacked
tag @a[current_world=true] remove GiveResources
tag @a[current_world=true] remove Playing
tag @a[current_world=true] remove Registered
tag @a[current_world=true] remove Spectating
tag @a[current_world=true] remove StopForfeit
tag @a[current_world=true] remove VotedForfeit
