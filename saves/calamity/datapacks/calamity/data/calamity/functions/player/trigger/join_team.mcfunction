# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: A player wants to join or leave a team, let them.
#>--------------------------------------------------------------------------------------------------

# Join a team
team join blue @a[current_world=true,scores={selectTeam=1}]
execute as @a[current_world=true,scores={selectTeam=1},gamemode=spectator] run function calamity:player/set_to_lobby_mode
execute as @a[current_world=true,scores={selectTeam=1}] run tellraw @a[current_world=true] {"translate":"system.message", "color":"blue","with":[{"translate":"calamity.joined.team", "with":[{"selector":"@s[scores={selectTeam=1}]"},{"translate":"team.blue"}]}]}
team join red @a[current_world=true,scores={selectTeam=2}]
execute as @a[current_world=true,scores={selectTeam=2},gamemode=spectator] run function calamity:player/set_to_lobby_mode
execute as @a[current_world=true,scores={selectTeam=2}] run tellraw @a[current_world=true] {"translate":"system.message", "color":"red","with":[{"translate":"calamity.joined.team", "with":[{"selector":"@s[scores={selectTeam=2}]"},{"translate":"team.red"}]}]}
team join spectator @a[current_world=true,scores={selectTeam=3}]
gamemode spectator @a[current_world=true,scores={selectTeam=3}]
execute as @a[current_world=true,scores={selectTeam=3}] run tellraw @a[current_world=true] {"translate":"system.message", "color": "gray","with":[{"translate":"calamity.sidelines", "with":[{"selector":"@s[scores={selectTeam=3}]"}]}]}

# Leave your team
tag @a[current_world=true,team=blue,scores={leaveTeam=1..}] add LeftBlue
tag @a[current_world=true,team=red,scores={leaveTeam=1..}] add LeftRed
team leave @a[current_world=true,scores={leaveTeam=1..}]
execute as @a[current_world=true,scores={leaveTeam=1..},tag=LeftBlue] run tellraw @a[current_world=true] { "translate":"system.message", "with":[ { "translate":"calamity.left.team", "with":[ {"selector":"@s[scores={leaveTeam=1..}]"}, { "translate":"spacer.middle", "color":"blue", "with":[ {"translate":"team.blue"}, {"translate":"b","font": "calamity:icons"} ] } ] } ] }

execute as @a[current_world=true,scores={leaveTeam=1..},tag=LeftRed] run tellraw @a[current_world=true] { "translate":"system.message", "with":[ { "translate":"calamity.left.team", "with":[ {"selector":"@s[scores={leaveTeam=1..}]"}, { "translate":"spacer.middle", "color":"red", "with":[ {"translate":"team.red"}, {"translate":"r","font": "calamity:icons"} ] } ] } ] }
tag @a[current_world=true,tag=LeftBlue] remove LeftBlue
tag @a[current_world=true,tag=LeftRed] remove LeftRed

# Always reset triggers if the score is not zero. We've already processed them, so let's just prep
#   them to be enabled.
scoreboard players set @a[current_world=true,scores={selectTeam=..-1}] selectTeam 0
scoreboard players set @a[current_world=true,scores={selectTeam=1..}] selectTeam 0
scoreboard players set @a[current_world=true,scores={leaveTeam=..-1}] leaveTeam 0
scoreboard players set @a[current_world=true,scores={leaveTeam=1..}] leaveTeam 0

# Always enable triggers
scoreboard players enable @a[current_world=true] selectTeam
scoreboard players reset @a[current_world=true,team=!] readyTeam
scoreboard players enable @a[current_world=true,team=blue] leaveTeam
scoreboard players enable @a[current_world=true,team=blue] readyTeam
scoreboard players enable @a[current_world=true,team=red] leaveTeam
scoreboard players enable @a[current_world=true,team=red] readyTeam
scoreboard players enable @a[current_world=true,team=spectator] leaveTeam
