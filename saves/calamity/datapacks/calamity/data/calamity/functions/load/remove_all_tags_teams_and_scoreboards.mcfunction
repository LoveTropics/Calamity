# Called from: #calamity:load
# TODO: Remove this from map loading state on release.

#>--------------------------------------------------------------------------------------------------
#> Purpose: When a objective is removed, all of its data is wiped clean. Since we use the scoreboard
#>	primarily for storing data, this becomes an efficient way to hard reset the project to its
#>	"factory state". If this projet were to ever need some kind of persistent data between sessions,
#>	another solution should be designed.
#>--------------------------------------------------------------------------------------------------

# Remove Scoreboard Objectives
scoreboard objectives remove CONST
scoreboard objectives remove AffectedItems
scoreboard objectives remove health
	
scoreboard objectives remove food
scoreboard objectives remove QueryResult
scoreboard objectives remove SuccessCount
scoreboard objectives remove loggedOff
scoreboard objectives remove timeSinceDeath

scoreboard objectives remove GeneratorTimer
scoreboard objectives remove progressLights
scoreboard objectives remove progressSecond
scoreboard objectives remove progressSound

scoreboard objectives remove displaySecond
scoreboard objectives remove displayPercent
scoreboard objectives remove displayPoints

scoreboard objectives remove prepScore
scoreboard objectives remove craftedScore
scoreboard objectives remove captureScore
scoreboard objectives remove killScore
scoreboard objectives remove streakPoints
scoreboard objectives remove streakLevel
scoreboard objectives remove nextStreakLevel
scoreboard objectives remove sessionID
scoreboard objectives remove leftGame
scoreboard objectives remove selectedItem
scoreboard objectives remove giveSpawnItems
scoreboard objectives remove itemValues
scoreboard objectives remove itemCounts

scoreboard objectives remove craftedObjItem01
scoreboard objectives remove craftedObjItem02
scoreboard objectives remove craftedObjItem03
scoreboard objectives remove craftedObjItem04
scoreboard objectives remove craftedObjItem05
scoreboard objectives remove craftedObjItem06
scoreboard objectives remove craftedObjItem07
scoreboard objectives remove craftedObjItem08
scoreboard objectives remove craftedObjItem09
scoreboard objectives remove craftedObjItem11
scoreboard objectives remove craftedObjItem12
scoreboard objectives remove craftedObjItem13
scoreboard objectives remove craftedObjItem14
scoreboard objectives remove craftedObjItem15
scoreboard objectives remove craftedObjItem16
scoreboard objectives remove craftedObjItem17
scoreboard objectives remove craftedObjItem18
scoreboard objectives remove craftedObjItem19
scoreboard objectives remove craftedObjItem20
scoreboard objectives remove craftedObjItem21
scoreboard objectives remove craftedObjItem22
scoreboard objectives remove craftedObjItem23
scoreboard objectives remove craftedObjItem24
scoreboard objectives remove craftedObjItem25
scoreboard objectives remove craftedObjItem26
scoreboard objectives remove craftedObjItem27
scoreboard objectives remove craftedObjItem28
scoreboard objectives remove craftedObjItem29
scoreboard objectives remove craftedObjItem31
scoreboard objectives remove craftedObjItem32
scoreboard objectives remove gameVariable

# Remove all tags
tag @a remove ForfeitTriggered
tag @a remove GiveEffects
tag @a remove GiveEnchant
tag @a remove GiveMessage
tag @a remove GiveMessageAttack
tag @a remove GiveMessageAttacked
tag @a remove GiveResources
tag @a remove Playing
tag @a remove Registered
tag @a remove Spectating
tag @a remove StopForfeit
tag @a remove VotedForfeit

# Remove Scoreboard Teams
team remove lobby
team remove spectator
team remove blue
team remove red
team remove finishLine

# Reset relevant gamerules
gamerule doImmediateRespawn false
gamerule doFireTick false