
#CALL - events/5v5/round/start
#CONTEXT - Console

#DESC - starts the preparation phase

#PHASE DATA KEY
#1 - prepare
#2 - fight
#3 - overtime
#4 - postgame

#phase
scoreboard players set phase GAME 1

#timer does not tick down during prepare phase
scoreboard players set ticking GAME 0

#timer
#/redundant, timer just needs to be set to a non zero value.
scoreboard players set timer GAME 999


#PLAYER TP
execute as @a[tag=ingame] at @s run function cmd:game/landmarks/playercells/playertp/run
execute as @a[tag=ingame] run gamemode adventure @s

#PLAYER STATUS
scoreboard players set @a[tag=ingame] playerstate 3
effect clear @s
clear @a[tag=ingame]
scoreboard players set @a[tag=ingame] prep_ready 0

#PLAYERBOX
execute as @e[tag=playerbox] at @s run function cmd:game/events/5v5/phase/prepare/boxunlock

#/DEBUG
tellraw @a "PREPARE PHASE START"
