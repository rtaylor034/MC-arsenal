

#modeldata
data modify storage cmd:var display.items[0].tag.CustomModelData set from storage cmd:controls/display itemIcon.ability.empty

#NAME
#slot identity
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/abilities slotIdentities
data modify storage cmd:process/array/cycleto tag.slot set from storage cmd:var display.items[0].tag.menu.tags.slot
function cmd:process/array/cycleto/run
data modify storage cmd:var boxmenu.root.slotid set from storage cmd:process/array/cycleto out[0]

#sign parse
data merge block 0 0 0 {Text1:'[{"nbt":"boxmenu.root.slotid.name","storage":"cmd:var","color":"dark_gray","bold":false,"italic":false},{"text":" Ability ","color":"dark_gray","bold":false,"italic":false},{"nbt":"get.keysuffix","storage":"cmd:var","interpret":true}]'}
data modify storage cmd:var display.items[0].tag.display.Name set from block 0 0 0 Text1
