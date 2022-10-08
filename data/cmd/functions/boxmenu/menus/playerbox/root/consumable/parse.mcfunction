
#Called when page is selected by item (from events/onselection/call)
#template - {Slot:0b,id:"minecraft:stick",Count:1b,tag:{menu:{template:{s1:1}}}}

#NOTE - This box must have a playerid score corresponding to which players box this is.

#get consumable
scoreboard players operation get.playerid var = @s playerid
execute store result score get.slot var run data get storage cmd:var display.items[0].tag.menu.tags.slot
function cmd:consumable/item/get/run

#set
data modify storage cmd:var display.items[0] merge from storage cmd:var get.item

#sell/buy
execute unless score isready var matches 1 if score get.success var matches 1.. run function cmd:boxmenu/menus/playerbox/root/consumable/parsesell
execute unless score isready var matches 1 unless score get.success var matches 1.. run function cmd:boxmenu/menus/playerbox/root/consumable/parsebuy
