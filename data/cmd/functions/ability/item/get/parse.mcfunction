#call - run
#parses the item

#BASE ITEM
data modify storage cmd:var get.item set value {Count:1b,id:"minecraft:leather_helmet",tag:{HideFlags:127}}





#NAME
execute unless score get.keybindslot var matches 1.. run data merge block 0 0 0 {Text1:'{"nbt":"get.a.name","storage":"cmd:var","color":"green","bold":false,"italic":false}'}

execute if score get.keybindslot var matches 1.. run data merge block 0 0 0 {Text1:'[{"nbt":"get.a.name","storage":"cmd:var","color":"green","bold":false,"italic":false},{"text":" "},{"nbt":"get.keysuffix","storage":"cmd:var","interpret":true}]'}

data modify storage cmd:var get.item.tag.display.Name set from block 0 0 0 Text1


#LORE

#USE DATA
scoreboard players set get.use var 0
execute store result score get.uses var if data storage cmd:var get.a.uses[]
#get use descriptions
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/descs abilities
data modify storage cmd:process/array/cycleto tag.id set from storage cmd:var get.a.id
function cmd:process/array/cycleto/run
data modify storage cmd:var get.usedescs set from storage cmd:process/array/cycleto out[0].uses

function cmd:ability/item/get/foreachuse

#TYPE
#cycle
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/abilities typeIdentities
data modify storage cmd:process/array/cycleto tag.type set from storage cmd:var get.a.type
function cmd:process/array/cycleto/run
#parse
data merge block 0 0 0 {Text1:'[{"text":" Type: ","color":"gray","bold":false,"italic":false},{"nbt":"out[0].displayJson","storage":"cmd:process/array/cycleto","interpret":true}]'}
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 Text1

#BORDER COLOR
data modify storage cmd:process/math/rgbtodecimal in set from storage cmd:process/array/cycleto out[0].color
function cmd:process/math/rgbtodecimal/run
execute store result storage cmd:var get.item.tag.display.color int 1 run scoreboard players get rgbtodecimal.out var



#DEV ID
data merge block 0 0 0 {Text1:'[{"score":{"name":"get.id","objective":"var"},"color":"dark_gray","bold":false,"italic":false},{"text":" : ","color":"dark_gray","bold":false,"italic":false}, {"nbt":"get.a.devName","storage":"cmd:var","color":"dark_gray","bold":false,"italic":false}]'}
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 Text1


#MODELDATA
execute store result score get.offset var run data get storage cmd:controls/display abilityIcon.offset
scoreboard players operation get.offset var += get.id var
execute store result storage cmd:var get.item.tag.CustomModelData int 1 run scoreboard players get get.offset var
