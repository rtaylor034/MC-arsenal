
#IN - A (weapon.choose.type -> var) | upgrade path id
#OVERLOAD - A (armor.cycleto.player -> var) | playerid
#OUT - (weapon.upgrade.out -> var) | weapon level | AFFECTS [cmd:storage/armor -> array[0].array[0]]

#calls cycleto for overload
function cmd:player/armor/array/cycleto/run

#SET TYPE IN ARRAY
execute store result storage cmd:storage/armor array[0].weapon.type int 1 run scoreboard players get weapon.choose.type var
execute store result storage cmd:storage/armor array[0].weapon.itemtag.customtags.type int 1 run scoreboard players get weapon.choose.type var

#EQUIP ABILITY
#cycle weaponIdentity array
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/weapons baseIdentities
execute store result storage cmd:process/array/cycleto tag.type int 1 run scoreboard players get weapon.choose.type
function cmd:process/array/cycleto/run
data modify storage cmd:var choose.w set from storage cmd:process/array/cycleto out[0]
#find player
execute store result score choose.playerid var run data get storage cmd:storage/armor array[0].playerid
execute as @a if score @s playerid = choose.playerid var run tag @s add choose-player
#equip
scoreboard players set equip.slot var 4
execute store result score equip.id var run data get storage cmd:var choose.w.abilityid
execute as @a[tag=choose-player] at @s run function cmd:player/abilities/equip/run


#RESETS
data remove storage cmd:var choose
tag @a remove choose-player
scoreboard players reset weapon.choose.type var
scoreboard players reset choose.playerid var
