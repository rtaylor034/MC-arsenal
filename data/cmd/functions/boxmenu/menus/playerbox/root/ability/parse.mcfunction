



#get ability item
scoreboard players operation get.playerid var = @s playerid
execute store result score get.slot var run data get storage cmd:var display.items[0].tag.menu.tags.slot
function cmd:ability/item/get/run
execute if score get.success var matches 1 run data modify storage cmd:var display.items[0] merge from storage cmd:var get.item

execute unless score get.success var matches 1 run function cmd:boxmenu/menus/playerbox/root/ability/emptyparse

#button lore
execute unless score isready var matches 1 if score get.success var matches 1 run data modify storage cmd:var display.items[0].tag.display.Lore prepend value '{"text":"[Change]","color":"gold","italic":false,"bold":true}'
execute unless score isready var matches 1 unless score get.success var matches 1 run data modify storage cmd:var display.items[0].tag.display.Lore prepend value '{"text":"[Select]","color":"green","italic":false,"bold":true}'
