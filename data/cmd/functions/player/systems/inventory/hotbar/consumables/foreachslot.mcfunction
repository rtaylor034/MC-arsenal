

#DECRIMENT
scoreboard players remove consumables.i var 1

#ref var
data modify storage cmd:var consumables.c set from storage cmd:var consumables.slots[0]
execute store result score consumables.c.id var run data get storage cmd:var consumables.c.id
execute store result score consumables.c.slot var run data get storage cmd:var consumables.c.slot


#get hotbar item
scoreboard players operation getitem.slot var = consumables.c.slot var
function cmd:player/inventory/hotbar/consumables/getitem/run

#check and update (checks for id mismatch, or if there is just no {consumable:x} tag)
execute store result score consumables.itemid var run data get storage cmd:var getitem.out.tag.customtags.consumable
scoreboard players operation update.slot var = consumables.c.slot var
execute unless score consumables.itemid var = consumables.c.id var run function cmd:player/inventory/hotbar/consumables/update/run
execute unless data storage cmd:var getitem.out.tag.customtags.consumable run function cmd:player/inventory/hotbar/consumables/update/run
scoreboard players reset update.slot var

#CYCLE
data modify storage cmd:var consumables.slots append from storage cmd:var consumables.slots[0]
data remove storage cmd:var consumables.slots[0]



#LOOP
execute if score consumables.i var matches 1.. run function cmd:player/systems/inventory/hotbar/consumables/foreachslot
