
#IN - A (armor.getitem.player -> var), B (armor.getitem.type -> var), C (armor.getitem.parse -> var = 0) D (armor.getitem.weapon -> var = 0)| playerid, armor type, parse item?, weapon?
#OUT - A [armor.getitem.item -> cmd:var ; Obj] | Item Object
#DESC - returns the armor peice item from the player [A] of type [B] from the armor array. If [C] is set to 1, then the armor peice from the item array will be parsed, and then returned. If [D] is set to 1, return the weapon item.

#TYPE KEY

#Armor
#1 - Boots
#2 - Leggings
#3 - Chestplate
#4 - Helmet


#parse
execute if score armor.getitem.parse var matches 1.. run function cmd:player/armor/getitem/parse

#base object
data modify storage cmd:var armor.getitem.item set value {id:"minecraft:stone",Count:1}

#cycleto item
execute unless score armor.getitem.weapon var matches 1.. run data modify storage cmd:process/array/cycleto array set from storage cmd:controls/armor names.armorTypes
execute unless score armor.getitem.weapon var matches 1.. run execute store result storage cmd:process/array/cycleto tag.type int 1 run scoreboard players get armor.getitem.type var
execute unless score armor.getitem.weapon var matches 1.. run function cmd:process/array/cycleto/run

#Item id
data modify storage cmd:var armor.getitem.item.id set from storage cmd:process/array/cycleto out[0].item
execute if score armor.getitem.weapon var matches 1.. run data modify storage cmd:var armor.getitem.item.id set value "minecraft:carrot_on_a_stick"

#cycleto
scoreboard players operation armor.cycleto.player var = armor.getitem.player var
scoreboard players operation armor.cycleto.type var = armor.getitem.type var
function cmd:player/armor/array/cycleto/run

#NBT tag
execute unless score armor.getitem.weapon var matches 1.. run data modify storage cmd:var armor.getitem.item.tag set from storage cmd:storage/armor array[0].armor[0].itemtag
execute if score armor.getitem.weapon var matches 1.. run data modify storage cmd:var armor.getitem.item.tag set from storage cmd:storage/armor array[0].weapon.itemtag
#hideflags
data modify storage cmd:var armor.getitem.item.tag.HideFlags set value 127




#RESETS
scoreboard players reset armor.getitem.weapon var
scoreboard players reset armor.getitem.player var
scoreboard players reset armor.getitem.type var
scoreboard players reset armor.getitem.parse var
