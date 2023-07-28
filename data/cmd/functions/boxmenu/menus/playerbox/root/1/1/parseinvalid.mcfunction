
#parses an invalid passive item (already equipped)

#prepend to item array
data modify storage cmd:var display.list.items prepend value {Count:1b,id:"minecraft:purple_dye",tag:{HideFlags:127}}

#modeldata
execute store result storage cmd:var display.list.items[0].tag.CustomModelData int 1 run scoreboard players get get.modeldata var

#NAME
data modify block 0 0 0 front_text.messages[0] set value '{"nbt":"boxmenu.root.1.1.passives[0].name","storage":"cmd:var","bold":false,"italic":false}'
data modify storage cmd:var display.list.items[0].tag.display.Name set from block 0 0 0 front_text.messages[0]


#BUTTON
#get name of armor
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/armor names.armorTypes
data modify storage cmd:process/array/cycleto tag.type set from storage cmd:var boxmenu.root.1.1.passives[0].equipped
function cmd:process/array/cycleto/run

#sign parse
data modify block 0 0 0 front_text.messages[0] set value '[{"text":"Already on ","color":"dark_aqua","bold":true,"italic":false},{"nbt":"out[0].name","storage":"cmd:process/array/cycleto","color":"dark_aqua","bold":true,"italic":false}]'

data modify storage cmd:var display.list.items[0].tag.display.Lore prepend from block 0 0 0 front_text.messages[0]

#add tags
data modify storage cmd:var display.list.items[0].tag.menu.playerbox set value {s1:1,s2:1}
data modify storage cmd:var display.list.items[0].tag.menu.tags merge value {invalid:1}
