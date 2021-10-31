# Called from: calamity:game_state/tick_match

#>--------------------------------------------------------------------------------------------------
#> Purpose: Red has forfeited, let's have a prestige for the Blue team!
#>--------------------------------------------------------------------------------------------------

# Team forfeited
tellraw @a[current_world=true] {"translate":"system.message","color": "red","with":[{"translate":"calamity.forfeit","with":[{"translate":"team.red"},{"translate":"r","font": "calamity:icons"}]}]}
# Example: ">>> 250 to 75. Blue r won by 175 points in 03:43 T!"

# How much did the team win by?
scoreboard players operation #tempVar gameVariable = BluePoints gameVariable
scoreboard players operation #tempVar gameVariable -= RedPoints gameVariable

# Send statistics message in chat box
execute if score displaySecond gameVariable matches 0..9 run tellraw @a[current_world=true] { "translate":"system.message", "with":[ { "translate":"calamity.match.stats","color": "green", "with":[ {"score":{"name": "BluePoints","objective": "gameVariable"},"color": "blue"}, {"score":{"name": "RedPoints","objective": "gameVariable"},"color": "red"}, {"translate":"team.blue","color":"blue"}, {"translate":"b","font": "calamity:icons","color":"blue"}, {"score":{"name": "#tempVar","objective": "gameVariable"},"color": "blue"}, {"translate":"spacer.middle","color":"white","with":[{"translate":"%s:0%s", "with": [ {"score":{"name":"displayMinute", "objective":"gameVariable"} }, {"score":{"name":"displaySecond", "objective":"gameVariable"} } ] }, {"translate":"3","font":"calamity:icons"} ] } ] } ] }
execute if score displaySecond gameVariable matches 10.. run tellraw @a[current_world=true] { "translate":"system.message", "with":[ {"translate":"calamity.match.stats","color": "green", "with":[ {"score":{"name": "BluePoints","objective": "gameVariable"},"color": "blue"}, {"score":{"name": "RedPoints","objective": "gameVariable"},"color": "red"}, {"translate":"team.blue","color":"blue"}, {"translate":"b","font": "calamity:icons","color":"blue"}, {"score":{"name": "#tempVar","objective": "gameVariable"},"color": "blue"}, {"translate":"spacer.middle","color":"white","with":[{"translate":"%s:%s","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"} } ]},{"translate":"3","font":"calamity:icons"}]} ] } ] }

# Send toast
title @a[current_world=true] times 20 200 20
title @a[current_world=true,team=blue] subtitle {"translate":"calamity.prestige.redForfeit.blue","color": "green","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[current_world=true,team=blue] title {"translate":"G","font":"calamity:icons"}
title @a[current_world=true,team=red] subtitle {"translate":"calamity.prestige.redForfeit.red","color": "red","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[current_world=true,team=red] title {"translate":"C","font":"calamity:icons"}
