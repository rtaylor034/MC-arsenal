
#IN - N/A
#OUT - N/A
#CONTEXT - @s

#USE - teleports this player to the correct playercell.

tag @s add lm-search
execute as @e[type=marker,tag=playercell] if score @s playerid = @a[tag=lm-search,limit=1] playerid run tp @a[tag=lm-search,limit=1] @s
tag @s remove lm-search
