

#DECRIMENT
scoreboard players remove remove.i var 1

#store
execute if score remove.id var matches 0.. store result storage cmd:var remove.find int 1 run scoreboard players get remove.id var
execute store result score remove.amount var run data get storage cmd:var remove.effects[0].amount

#COMPARE
#stat
scoreboard players set remove.keep var 0
execute if score remove.id var matches 0.. store success score remove.keep var run data modify storage cmd:var remove.find set from storage cmd:var remove.effects[0].id

#range
execute if score remove.keep var matches 0 if score remove.range var matches ..-1 store success score remove.keep var unless score remove.amount var <= remove.range var
execute if score remove.keep var matches 0 if score remove.range var matches 0 run scoreboard players set remove.keep var 0
execute if score remove.keep var matches 0 if score remove.range var matches 1.. store success score remove.keep var unless score remove.amount var >= remove.range var

#FOUND
#store in out array
execute if score remove.keep var matches 0 run data modify storage cmd:var remove.out append from storage cmd:var remove.effects[0]
execute if score remove.keep var matches 0 run data modify storage cmd:var remove.effects[0].time set value 0

#CYCLE
data modify storage cmd:var remove.effects append from storage cmd:var remove.effects[0]
data remove storage cmd:var remove.effects[0]


#LOOP
execute if score remove.i var matches 1.. run function cmd:player/effects/stat/remove/foreacheffect
