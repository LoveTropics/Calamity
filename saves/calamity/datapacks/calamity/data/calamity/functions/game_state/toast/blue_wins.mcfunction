# Called from: calamity:game_state/tick_match

#>--------------------------------------------------------------------------------------------------
#> Purpose: Blue has won the game, let's announce it
#>--------------------------------------------------------------------------------------------------

# Output match statistics
# Example: ">>> 250 to 75. Red r won by 175 points in 03:43 T!"
function calamity:player/update_displays
scoreboard players operation #tempVar gameVariable = BluePoints gameVariable
scoreboard players operation #tempVar gameVariable -= RedPoints gameVariable
execute if score displaySecond gameVariable matches 0..9 run tellraw @a[current_world=true] { "translate":"system.message", "with":[ { "translate":"calamity.match.stats","color": "green", "with":[ {"score":{"name": "BluePoints","objective": "gameVariable"},"color": "blue"}, {"score":{"name": "RedPoints","objective": "gameVariable"},"color": "red"}, {"translate":"team.blue","color":"blue"}, {"translate":"b","font": "calamity:icons","color":"blue"}, {"score":{"name": "#tempVar","objective": "gameVariable"},"color": "blue"}, {"translate":"spacer.middle","color":"white","with":[{"translate":"%s:0%s", "with": [ {"score":{"name":"displayMinute", "objective":"gameVariable"} }, {"score":{"name":"displaySecond", "objective":"gameVariable"} } ] }, {"translate":"3","font":"calamity:icons"} ] } ] } ] }
execute if score displaySecond gameVariable matches 10.. run tellraw @a[current_world=true] { "translate":"system.message", "with":[ {"translate":"calamity.match.stats","color": "green", "with":[ {"score":{"name": "BluePoints","objective": "gameVariable"},"color": "blue"}, {"score":{"name": "RedPoints","objective": "gameVariable"},"color": "red"}, {"translate":"team.blue","color":"blue"}, {"translate":"b","font": "calamity:icons","color":"blue"}, {"score":{"name": "#tempVar","objective": "gameVariable"},"color": "blue"}, {"translate":"spacer.middle","color":"white","with":[{"translate":"%s:%s","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"} } ]},{"translate":"3","font":"calamity:icons"}]} ] } ] }

# Send toast
title @a[current_world=true] times 20 200 20
title @a[current_world=true,team=blue] subtitle {"translate":"calamity.prestige.won","color": "green","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[current_world=true,team=blue] title {"translate":"G","font":"calamity:icons"}
title @a[current_world=true,team=red] subtitle {"translate":"calamity.prestige.lost","color": "red","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[current_world=true,team=red] title {"translate":"C","font":"calamity:icons"}

# End the match
function calamity:game_state/end_match
