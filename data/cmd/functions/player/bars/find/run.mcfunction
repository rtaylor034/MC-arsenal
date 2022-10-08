
#IN - (@s -> playerid) | playerid
#OUT - N/A
#USE - Adds the tag "ownbar" to this player's bars.

#NOTE - IMPORTANT **ABSOLUTELY MUST** call "cmd:player/bars/unfind/run" for every time this is called. (in the same tick or function).
#NOTE - "trackcount" is a count of how many times the bars has been found this tick, and makes sure that there is no complications with removing the tag prematurely and causing errors.

#NOTE - IMPORTANT - Make sure that ONLY 1 player's bars is found at once, **NEVER EVER** should 2 seperate player's bars have the tag "track" at the same time.

#NOTE - works exactly like tracker find/unfind
scoreboard players operation barfind.id var = @s playerid
execute as @e[type=minecraft:armor_stand,tag=bar] if score @s playerid = barfind.id var run tag @s add ownbar
execute as @e[type=minecraft:armor_stand,tag=ownbar] run scoreboard players add @s trackcount 1


scoreboard players reset barfind.id var
