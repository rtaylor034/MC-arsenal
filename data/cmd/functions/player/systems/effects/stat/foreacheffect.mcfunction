
#CALL - systems/effects/base

#DECRIMENT
scoreboard players remove effects.i var 1


#CYCLE
data modify storage cmd:var effects.stat append from storage cmd:var effects.stat[0]
data remove storage cmd:var effects.stat[0]

#stat id/amount store
execute store result score effects.id var run data get storage cmd:var effects.stat[0].id 1
execute store result score effects.amount var run data get storage cmd:var effects.stat[0].amount 1


#INFLICT
execute store result score effects.inflict var run data get storage cmd:var effects.stat[0].inflict 1
execute as @a[tag=found,limit=1] at @s if score effects.inflict var matches 1 run function cmd:player/systems/effects/stat/inflict


#TIMER
#store and decriment
execute store result score effects.time var run data get storage cmd:var effects.stat[0].time 1
scoreboard players remove effects.time var 1
execute store result storage cmd:var effects.stat[0].time int 1 run scoreboard players get effects.time var


#ZERO
execute as @a[tag=found,limit=1] at @s if score effects.time var matches ..0 run function cmd:player/systems/effects/stat/zero



#LOOP
execute if score effects.i var matches 1.. run function cmd:player/systems/effects/stat/foreacheffect
