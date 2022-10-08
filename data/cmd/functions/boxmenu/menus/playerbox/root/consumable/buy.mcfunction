
#DESC - sell this consumable

#GET PREVIOUS CONSUMABLE
scoreboard players operation get.playerid var = @a[tag=boxmenu-owner,limit=1,sort=nearest] playerid
execute store result score get.slot var run data get storage cmd:var selection.menu.tags.slot
function cmd:consumable/item/get/run


#EQUIP
execute store result score equip.slot var run data get storage cmd:var selection.menu.tags.slot
execute store result score equip.id var run data get storage cmd:var selection.menu.tags.id
execute as @a[tag=boxmenu-owner] at @s run function cmd:player/consumables/equip/run



#VFX
execute as @a[tag=boxmenu-owner] at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.5 1.782
execute as @a[tag=boxmenu-owner] at @s run playsound minecraft:item.armor.equip_chain master @s ~ ~ ~ 0.5 1.059
execute if score get.success var matches 1 as @a[tag=boxmenu-owner] at @s run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 0.4 1.414


#REMOVE CURRENCY
execute store result score give.amount var run data get storage cmd:var selection.menu.tags.cost
execute if score get.success var matches 1 run scoreboard players operation give.amount var -= get.cost var
scoreboard players operation give.amount var *= -1 const
execute as @a[tag=boxmenu-owner] at @s run function cmd:player/currency/c/give/run
