
#CHANGE PASSIVE STORAGE ARRAY
data modify storage cmd:process/array/mergetoall array set from entity @s data.storage.passives
data modify storage cmd:process/array/mergetoall condition.id set from storage cmd:var selection.menu.tags.passiveid
data modify storage cmd:process/array/mergetoall tag.equipped set from storage cmd:var selection.menu.tags.type
function cmd:process/array/mergetoall/run
#tellraw @a {"storage":"cmd:process/array/mergetoall","nbt":"out"}
execute unless data storage cmd:var selection.menu.tags.weapon run data modify entity @s data.storage.passives set from storage cmd:process/array/mergetoall out

#UPGRADE
execute store result score armor.upgrade.passive var run data get storage cmd:var selection.menu.tags.passiveid
execute store result score armor.upgrade.in var run data get storage cmd:var selection.menu.tags.upgradeid
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
execute as @a[tag=boxmenu-owner] at @s run playsound minecraft:item.armor.equip_netherite master @s ~ ~ ~ 0.5 1.414
execute as @a[tag=boxmenu-owner] at @s run playsound minecraft:item.armor.equip_diamond master @s ~ ~ ~ 0.5 1.059
execute as @a[tag=boxmenu-owner] at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.63
