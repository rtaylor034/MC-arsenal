

#DECRIMENT
scoreboard players remove cooldowns.i var 1

#ref var
data modify storage cmd:var cooldowns.a set from storage cmd:var cooldowns.abilities[0]


#update input
execute store result score update.slot var run data get storage cmd:var cooldowns.a.slot

#COUNT CHECK
#store time
execute store result score cooldowns.seconds var run data get storage cmd:var cooldowns.a.time .05
scoreboard players add cooldowns.seconds var 1
execute store result score cooldowns.time var run data get storage cmd:var cooldowns.a.time

#getitem
execute store result score getitem.slot var run data get storage cmd:var cooldowns.a.slot
function cmd:player/inventory/hotbar/cooldowns/getitem/run
execute store result score cooldowns.count var run data get storage cmd:var getitem.out.Count

#update if count mismatch
execute if score cooldowns.time var matches 1.. unless score cooldowns.count var = cooldowns.seconds var run function cmd:player/inventory/hotbar/cooldowns/update/run

#ABILITY READY CHECK
execute store success score cooldowns.itemmatch var run data modify storage cmd:var getitem.out.id set value "minecraft:leather_helmet"
execute if score cooldowns.time var matches ..0 if score cooldowns.itemmatch var matches 1 run function cmd:player/inventory/hotbar/cooldowns/update/run
execute if score cooldowns.time var matches 1.. if score cooldowns.itemmatch var matches 0 run function cmd:player/inventory/hotbar/cooldowns/update/run
#CYCLE
data modify storage cmd:var cooldowns.abilities append from storage cmd:var cooldowns.abilities[0]
data remove storage cmd:var cooldowns.abilities[0]


#LOOP
execute if score cooldowns.i var matches 1.. run function cmd:player/systems/inventory/hotbar/cooldowns/foreachability
