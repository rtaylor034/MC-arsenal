
#CALL - systems/effects/base

#DECRIMENT
scoreboard players remove effects.i var 1


#CYCLE
data modify storage cmd:var effects.status append from storage cmd:var effects.status[0]
data remove storage cmd:var effects.status[0]

#TIMER
#store and decriment
execute store result score effects.time var run data get storage cmd:var effects.status[0].time 1
scoreboard players remove effects.time var 1
execute store result storage cmd:var effects.status[0].time int 1 run scoreboard players get effects.time var

#reference var
data modify storage cmd:var e set from storage cmd:var effects.status[0]

#CALL TO CHECKALL
execute as @a[tag=found,limit=1] at @s run function cmd:player/effects/status/checkall

#reference set
data modify storage cmd:var effects.status[0] set from storage cmd:var e

#REMOVE INFLICT
data remove storage cmd:var effects.status[0].inflict


#REMOVE WHEN ZERO
execute if score effects.time var matches ..0 run data remove storage cmd:var effects.status[0]

#LOOP
execute if score effects.i var matches 1.. run function cmd:player/systems/effects/status/foreacheffect
