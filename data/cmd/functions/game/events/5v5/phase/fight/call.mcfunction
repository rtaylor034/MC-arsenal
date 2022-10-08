
#CALL - events/5v5/round/start
#CONTEXT - Console

#DESC - starts the preparation phase

#PHASE DATA KEY
#1 - prepare
#2 - fight
#3 - overtime
#4 - postgame

#phase
scoreboard players set phase GAME 2
scoreboard players set ticking GAME 1

#timer
execute store result score timer GAME run data get storage cmd:controls/game 5v5.phases.fight.time

#PARSE ARMOR
function cmd:player/armor/array/parse/run

#player
execute as @a[tag=ingame] at @s run function cmd:game/events/5v5/phase/fight/playerprep

#/DEBUG
tellraw @a "FIGHT PHASE START"
