
#gets each stats item and adds it to (display.list.items -> var)




#get data
execute store result score get.statid var run data get storage cmd:var boxmenu.root.1.stats[0].id
function cmd:modeldata/staticon/get/run

#prepend to item array
data modify storage cmd:var display.list.items prepend value {Count:1b,id:"minecraft:leather_helmet",tag:{HideFlags:127}}

#color
execute store result storage cmd:var display.list.items[0].tag.display.color int 1 run scoreboard players get get.color var
#modeldata
execute store result storage cmd:var display.list.items[0].tag.CustomModelData int 1 run scoreboard players get get.modeldata var

#NAME
data merge block 0 0 0 {Text1:'{"nbt":"boxmenu.root.1.stats[0].name","storage":"cmd:var","bold":false,"italic":false}'}
data modify storage cmd:var display.list.items[0].tag.display.Name set from block 0 0 0 Text1


#BUTTON
data modify storage cmd:var display.list.items[0].tag.display.Lore prepend value '{"text":"[Select]","bold":true,"italic":false,"color":"light_purple"}'



#add tags
data modify storage cmd:var display.list.items[0].tag.menu.tags.id set from storage cmd:var boxmenu.root.1.stats[0].id


#send item to back of array
#this is to keep items in correct order, instead of reverse, because items are prepended
data modify storage cmd:var display.list.items append from storage cmd:var display.list.items[0]
data remove storage cmd:var display.list.items[0]



#loop
data remove storage cmd:var boxmenu.root.1.stats[0]
execute if data storage cmd:var boxmenu.root.1.stats[] run function cmd:boxmenu/menus/playerbox/root/1/foreachstat
