
#parses a valid passive item (not already equipped)





#prepend to item array
data modify storage cmd:var display.list.items prepend value {Count:1b,id:"minecraft:purple_dye",tag:{HideFlags:127}}

#modeldata
execute store result storage cmd:var display.list.items[0].tag.CustomModelData int 1 run scoreboard players get get.modeldata var

#NAME
data merge block 0 0 0 {Text1:'{"nbt":"boxmenu.root.1.1.passives[0].name","storage":"cmd:var","bold":false,"italic":false}'}
data modify storage cmd:var display.list.items[0].tag.display.Name set from block 0 0 0 Text1


#BUTTON
data modify storage cmd:var display.list.items[0].tag.display.Lore prepend value '{"text":"[Select]","bold":true,"italic":false,"color":"light_purple"}'

#add tags
data modify storage cmd:var display.list.items[0].tag.menu.tags.passiveid set from storage cmd:var boxmenu.root.1.1.passives[0].id
data modify storage cmd:var display.list.items[0].tag.menu.tags.upgradeid set from storage cmd:var boxmenu.root.1.1.passives[0].innatestat
data modify storage cmd:var display.list.items[0].tag.menu.playerbox set value {}
