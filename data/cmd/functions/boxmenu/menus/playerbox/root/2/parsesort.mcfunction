

#NAME
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/abilities typeIdentities
data modify storage cmd:process/array/cycleto tag.type set from storage cmd:var display.items[0].tag.menu.tags.type
function cmd:process/array/cycleto/run
data modify storage cmd:var boxmenu.root.2.sortname set from storage cmd:process/array/cycleto out[0].displayJson

#sign parse
data modify block 0 0 0 front_text.messages[0] set value '[{"text":"Show: ","color":"dark_aqua","bold":false,"italic":false},{"nbt":"boxmenu.root.2.sortname","storage":"cmd:var","interpret":true}]'
data modify storage cmd:var display.items[0].tag.display.Name set from block 0 0 0 front_text.messages[0]

#LORE
data modify storage cmd:var display.items[0].tag.display.Lore append value '{"text":"[Filter]","italic":false,"bold":true,"color":"dark_aqua"}'
