

#UPGRADE
execute store result score armor.upgrade.in var run data get storage cmd:var selection.menu.tags.id
execute store result score armor.cycleto.type var run data get storage cmd:var selection.menu.tags.type
execute store result score armor.upgrade.weapon var run data get storage cmd:var selection.menu.tags.weapon
scoreboard players operation armor.cycleto.player var = @s playerid
function cmd:player/armor/array/upgrade/run

#PARSE
execute store result score armor.parse.weapon var run data get storage cmd:var selection.menu.tags.weapon
execute store result score armor.parse.type var run data get storage cmd:var selection.menu.tags.type
scoreboard players operation armor.parse.player var = @s playerid
function cmd:player/armor/array/parse/run

#COST
execute store result score give.amount var run data get storage cmd:var selection.menu.tags.cost
scoreboard players operation give.amount var *= -1 const
execute as @a[tag=boxmenu-owner] at @s run function cmd:player/currency/t/give/run

#SOUND
execute as @a[tag=boxmenu-owner] at @s run playsound block.note_block.pling master @s ~ ~ ~ 0.5 1.782
execute as @a[tag=boxmenu-owner] at @s run playsound minecraft:item.armor.equip_netherite master @s ~ ~ ~ 0.5 1.587
execute as @a[tag=boxmenu-owner] at @s run playsound minecraft:item.armor.equip_diamond master @s ~ ~ ~ 0.5 1.189
execute as @a[tag=boxmenu-owner] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.5 1.782
