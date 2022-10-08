
#IN - (@s -> playerid) | playerid
#OUT - N/A
#USE - Adds the tag "track" to this player's tracker.

#NOTE - IMPORTANT **ABSOLUTELY MUST** call "cmd:player/tracker/unfind/run" for every time this is called. (in the same tick or function).
#NOTE - "trackcount" is a count of how many times the tracker has been found this tick, and makes sure that there is no complications with removing the tag prematurely and causing errors.

#NOTE - IMPORTANT - Make sure that ONLY 1 player's tracker is found at once, **NEVER EVER** should 2 seperate player's trackers have the tag "track" at the same time.

scoreboard players operation trackfind.id var = @s playerid
execute as @e[type=minecraft:marker,tag=tracker] if score @s playerid = trackfind.id var run tag @s add track
execute as @e[type=minecraft:marker,tag=track] run scoreboard players add @s trackcount 1


scoreboard players reset trackfind.id var
