

#UNEQUIP
execute store result score unequip.id var run data get storage cmd:var selection.menu.tags.id
execute as @a[tag=boxmenu-owner] at @s run function cmd:player/abilities/unequip/run

#EQUIP
execute store result score equip.id var run data get storage cmd:var selection.menu.tags.id
execute store result score equip.slot var run data get storage cmd:var selection.menu.tags.slot
execute as @a[tag=boxmenu-owner] at @s run function cmd:player/abilities/equip/run

#MARK AS EQUIPPED IN STORAGE ARRAY (AND REMOVE MARK FROM REPLACED)
#get team
data modify storage cmd:process/array/cycleto array set from storage cmd:storage/playerboxes abilities
execute store result storage cmd:process/array/cycleto tag.team int 1 run scoreboard players get @s team
function cmd:process/array/cycleto/run
#store data
data modify storage cmd:var playerbox.equip.abilities set from storage cmd:process/array/cycleto out
#mark ability
data modify storage cmd:process/array/cycleto array set from storage cmd:process/array/cycleto out[0].array
data modify storage cmd:process/array/cycleto tag.id set from storage cmd:var selection.menu.tags.id
function cmd:process/array/cycleto/run
execute store result storage cmd:process/array/cycleto out[0].equipped int 1 run scoreboard players get @s playerid
#remove mark from replaced ability
data modify storage cmd:process/array/cycleto array set from storage cmd:process/array/cycleto out
data modify storage cmd:process/array/cycleto tag.id set from storage cmd:var equip.replaced.id
function cmd:process/array/cycleto/run
execute if data storage cmd:var equip.replaced.id run data remove storage cmd:process/array/cycleto out[0].equipped
#go back to first ability (for order)
data modify storage cmd:process/array/cycleto array set from storage cmd:process/array/cycleto out
data modify storage cmd:process/array/cycleto tag.first set value 1
function cmd:process/array/cycleto/run
#set back to array
data modify storage cmd:var playerbox.equip.abilities[0].array set from storage cmd:process/array/cycleto out
data modify storage cmd:storage/playerboxes abilities set from storage cmd:var playerbox.equip.abilities

tag @e[type=marker,tag=boxmenu,distance=1..] add boxmenu-refresh



#SOUND
execute as @a[tag=boxmenu-owner] at @s run playsound block.note_block.pling master @s ~ ~ ~ 0.5 1.782
execute as @a[tag=boxmenu-owner] at @s if score unequip.success var matches 1 run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 0.4 1.888

#REFRESH OTHER BOXES
function cmd:boxmenu/refresh/run

#RESETS
data remove storage cmd:var playerbox.equip
