
#IN - (update.slot -> var) | consumable slot
#OUT - N/A

#USE - Updates the consumable display slot specified in (IN) on this player to show the correct consumable item.


#get consumable item
scoreboard players operation get.playerid var = @s playerid
scoreboard players operation get.slot var = update.slot var
function cmd:consumable/item/get/run

#nbt merge set
data modify storage cmd:var mergenbt set from storage cmd:var get.item.tag


#SLOTS
execute if score update.slot var matches 1 run function cmd:player/inventory/hotbar/consumables/update/sub/slot1
execute if score update.slot var matches 2 run function cmd:player/inventory/hotbar/consumables/update/sub/slot2
execute if score update.slot var matches 3 run function cmd:player/inventory/hotbar/consumables/update/sub/slot3
execute if score update.slot var matches 4 run function cmd:player/inventory/hotbar/consumables/update/sub/slot4


#RESETS
data remove storage cmd:var update
scoreboard players reset update.slot var
