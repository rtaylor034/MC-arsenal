
#Runs every tick from the player with this effect



#removes this effect if this player has no shield
execute as @s[scores={shield=..0}] run data modify storage cmd:var e.time set value 0
