
#CALL - from health/damage/inflict/run
#DESC - called by player when health reaches 0 due to damage inflicted

#PASS - (inflict.source -> var) | killer playerid
#PASSTYPE - (read)













#EVENT CALL: game/die
#tag this player with "nodie" if this player does not die
execute as @s[tag=!nodie] at @s run function cmd:player/events/game/die/call


#RESETS
tag @s remove nodie
