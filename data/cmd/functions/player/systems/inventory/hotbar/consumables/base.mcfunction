
#CALL - systems/inventory/base
#Called from all players every tick

#store tracker data
function cmd:player/tracker/find/run
data modify storage cmd:var consumables.slots set from entity @e[type=marker,tag=track,limit=1] data.consumables

#FOR EACH SLOT
execute store result score consumables.i var if data storage cmd:var consumables.slots[]
execute if score consumables.i var matches 1.. run function cmd:player/systems/inventory/hotbar/consumables/foreachslot


#RESETS
function cmd:player/tracker/unfind/run
data remove storage cmd:var consumables
scoreboard players reset consumables.i var
scoreboard players reset consumables.c.slot var
scoreboard players reset consumables.c.id var
scoreboard players reset consumables.mismatch var
