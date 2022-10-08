
#CALL - player/main
#DESC - Called by a player whenever a player drops an item

#NOTE - this is mainly for control and efficiency, as many things are probably going to run off of a drop, depending on what item the player dropped
#NOTE - Dropped items are either killed or given right back to the player that threw it. No items should ever be actually droppable.

#EVENT CALL: advancement/abilityslot/drop
function cmd:player/events/advancement/abilityslot/drop/call


#ITEM TAG/DATA
tag @e[type=item,nbt={Age:0s}] add drop-thrownitem
data modify storage cmd:var drop.thrown set from entity @e[type=item,tag=drop-thrownitem,limit=1,sort=nearest] Item

#CHECK ITEM
execute as @e[type=item,tag=drop-thrownitem] at @s run function cmd:player/events/action/drop/checkitem

#COOLDOWN SLOTS
#execute if data storage cmd:var drop.thrown.tag.customtags.cooldownslot store result score update.slot var run data get storage cmd:var drop.thrown.tag.customtags.cooldownslot
#execute if data storage cmd:var drop.thrown.tag.customtags.cooldownslot run function cmd:player/inventory/hotbar/cooldowns/update/run

#CONSUMABLE SLOTS
#execute if data storage cmd:var drop.thrown.tag.customtags.consumableslot store result score update.slot var run data get storage cmd:var drop.thrown.tag.customtags.consumableslot
#execute if data storage cmd:var drop.thrown.tag.customtags.consumableslot run function cmd:player/inventory/hotbar/consumables/update/run

#RESETS
scoreboard players reset @s drop
tag @e[type=item,tag=drop-thrownitem]
data remove storage cmd:var drop
