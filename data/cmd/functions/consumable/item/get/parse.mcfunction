
#parses the item

#BASE ITEM
data modify storage cmd:var get.item set value {Count:1b,id:"minecraft:carrot_on_a_stick"}


#NAME
data merge block 0 0 0 {Text1:'{"nbt":"get.a.name","storage":"cmd:var","color":"white","bold":false,"italic":false}'}
data modify storage cmd:var get.item.tag.display.Name set from block 0 0 0 Text1


#LORE


#DEV ID
data merge block 0 0 0 {Text1:'[{"score":{"name":"get.id","objective":"var"},"color":"dark_gray","bold":false,"italic":false},{"text":" : ","color":"dark_gray","bold":false,"italic":false}, {"nbt":"get.a.devName","storage":"cmd:var","color":"dark_gray","bold":false,"italic":false}]'}
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 Text1


#MODELDATA
execute store result score get.offset var run data get storage cmd:controls/display consumableIcon.offset
scoreboard players operation get.offset var += get.id var
execute store result storage cmd:var get.item.tag.CustomModelData int 1 run scoreboard players get get.offset var

#CONSUMABLE ID
execute store result storage cmd:var get.item.tag.customtags.consumable int 1 run scoreboard players get get.id var
