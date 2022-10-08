
#IN - @s
#OUT - N/A

#USE - teleports this player to the correct basespawn.

tag @s add bs-search
execute as @e[type=marker,tag=basespawn] if score @s playerid = @a[tag=bs-search,limit=1] playerid run tp @a[tag=bs-search,limit=1] @s
tag @s remove bs-search
