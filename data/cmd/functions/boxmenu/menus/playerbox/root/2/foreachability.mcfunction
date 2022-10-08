
#gets each abilities item and adds it to (display.list.items -> var)




#get ability
execute store result score get.id var run data get storage cmd:process/array/getmatching out[0].id
function cmd:ability/item/get/run

#prepend to item array
data modify storage cmd:var display.list.items prepend from storage cmd:var get.item

#add tags
execute unless data storage cmd:process/array/getmatching out[0].equipped unless data storage cmd:process/array/getmatching out[0].banned run data modify storage cmd:var display.list.items[0].tag.menu.tags.id set from storage cmd:process/array/getmatching out[0].id
data modify storage cmd:var display.list.items[0].tag.menu.playerbox set value {}

#BUTTONS
#base
execute unless data storage cmd:process/array/getmatching out[0].equipped unless data storage cmd:process/array/getmatching out[0].banned run data modify storage cmd:var display.list.items[0].tag.display.Lore prepend value '{"text":"[Equip]","bold":true,"italic":false,"color":"light_purple"}'
#equipped
execute if data storage cmd:process/array/getmatching out[0].equipped run function cmd:boxmenu/menus/playerbox/root/2/equipped
#banned
execute if data storage cmd:process/array/getmatching out[0].banned run function cmd:boxmenu/menus/playerbox/root/2/banned

#send item to back of array
#this is to keep items in correct order, instead of reverse, because items are prepended
data modify storage cmd:var display.list.items append from storage cmd:var display.list.items[0]
data remove storage cmd:var display.list.items[0]



#loop
data remove storage cmd:process/array/getmatching out[0]
execute if data storage cmd:process/array/getmatching out[] run function cmd:boxmenu/menus/playerbox/root/2/foreachability
