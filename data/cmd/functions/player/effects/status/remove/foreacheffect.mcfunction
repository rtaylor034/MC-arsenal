

#DECRIMENT
scoreboard players remove remove.i var 1

execute if data storage cmd:var remove.name run data modify storage cmd:var remove.find set from storage cmd:var remove.name
execute if score remove.type var matches 0.. store result storage cmd:var remove.find int 1 run scoreboard players get remove.type var

#COMPARE
execute if score remove.type var matches 0.. store success score remove.keep var run data modify storage cmd:var remove.find set from storage cmd:var remove.effects[0].type
execute if data storage cmd:var remove.name store success score remove.keep var run data modify storage cmd:var remove.find set from storage cmd:var remove.effects[0].name

#FOUND
#store in out array
execute if score remove.keep var matches 0 run data modify storage cmd:var remove.out append from storage cmd:var remove.effects[0]
execute if score remove.keep var matches 0 run data modify storage cmd:var remove.effects[0].time set value 0

#CYCLE
data modify storage cmd:var remove.effects append from storage cmd:var remove.effects[0]
data remove storage cmd:var remove.effects[0]


#LOOP
execute if score remove.i var matches 1.. run function cmd:player/effects/status/remove/foreacheffect
