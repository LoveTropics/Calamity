# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: Add up points when a player gains them, send messages, and update displays
#>--------------------------------------------------------------------------------------------------

scoreboard players set @a[current_world=true] prepScore 0

# Add up points
execute as @a[current_world=true,tag=Playing] run function calamity:points/check_if_crafted_items
execute as @a[current_world=true,tag=Playing] run scoreboard players operation @s prepScore += @s captureScore
scoreboard players set @a[current_world=true] captureScore 0
execute as @a[current_world=true,tag=Playing] run scoreboard players operation @s prepScore += @s killScore
scoreboard players set @a[current_world=true] killScore 0

# Add to team's pool of points
scoreboard players operation BluePoints gameVariable += @a[current_world=true,team=blue] prepScore
scoreboard players operation RedPoints gameVariable += @a[current_world=true,team=red] prepScore

# Update streak
execute as @a[current_world=true,tag=Playing] run scoreboard players operation @s nextStreakLevel += @s prepScore
execute as @a[current_world=true,tag=Playing] run scoreboard players operation @s streakPoints += @s prepScore
execute as @a[current_world=true,scores={timeSinceDeath=0,streakPoints=1..}] at @s run function calamity:points/end_streak_on_death
execute as @a[current_world=true,scores={prepScore=1..}] run function calamity:points/send_points_gained_message
execute as @a[current_world=true,scores={nextStreakLevel=15..}] run function calamity:points/award_new_streak_level

function calamity:player/update_displays
