
#CALL - events/game/die/call
#DESC - Called if the player actually died (and was not saved by triggering their death event).

#PASS - A (inflict.source -> var) | killer playerid
#PASSTYPE - A (read)


#LOG
tellraw @a ["",{"selector":"@s"}, {"text":" just died to "},{"score":{"name":"inflict.source","objective":"var"}}]

#EVENT CALL: game/getkill
scoreboard players operation getkill.killed var = @s playerid
execute as @a if score @s playerid = inflict.source var run tag @s add killer
execute as @a[tag=killer] at @s run function cmd:player/events/game/getkill/call
tag @a remove killer

#playerstate
scoreboard players set @s playerstate 2

#Classic game mode round end check
#/Will never run if last player leaves. must make general fix for leaving players.
execute if score mode GAME matches 1 run function cmd:player/events/game/die/checkwin

#RESETS
scoreboard players reset winteam var
