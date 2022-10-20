
#IN - A (weapon.upgrade.path -> var) | upgrade path id
#IN ALT - Aa (weapon.upgrade.augment -> var) | upgrade augment id
#OVERLOAD - A (armor.cycleto.player -> var) | playerid
#OUT - (weapon.upgrade.out -> var) | weapon level | AFFECTS [cmd:storage/armor -> array[0].weapon]

#DESC - Upgrades the player's weapon in [cmd:storage/armor array[0].array[0]], adding [IN A] to its path stats and [IN B] to its augments. Also increases the weapons level.

#NOTE - this also calls re-equips the player with the weapon ability to slot 4.

#calls cycleto for overload
function cmd:player/armor/array/cycleto/run

#get IN values -> [cmd:var -> upgrade.path, upgrade.augment]
execute if score weapon.upgrade.path var matches 1.. store result storage cmd:var upgrade.path int 1 run scoreboard players get weapon.upgrade.path var
execute if score weapon.upgrade.augment var matches 1.. store result storage cmd:var upgrade.augment int 1 run scoreboard players get weapon.upgrade.path var

#append IN to armor array weapon
execute if data storage cmd:var upgrade.path run data modify storage cmd:storage/armor array[0].weapon.path append from storage cmd:var upgrade.path
execute if data storage cmd:var upgrade.path run data modify storage cmd:storage/armor array[0].weapon.augment append from storage cmd:var upgrade.augment

#increase weapon level
execute store result score upgrade.lvl var run data get storage cmd:storage/armor array[0].weapon.level 1
scoreboard players add upgrade.lvl var 1
execute store result storage cmd:storage/armor array[0].weapon.level int 1 run scoreboard players get upgrade.lvl var

#EQUIP ABILITY
#cycle weaponIdentity array
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/weapons baseIdentities
data modify storage cmd:process/array/cycleto tag.type set from storage cmd:storage/armor array[0].weapon.type
function cmd:process/array/cycleto/run
data modify storage cmd:var upgrade.a set from storage cmd:process/array/cycleto out[0]
#find player
execute store result score choose.playerid var run data get storage cmd:storage/armor array[0].playerid
execute as @a if score @s playerid = choose.playerid var run tag @s add choose-player
#equip
scoreboard players set equip.slot var 4
execute store result score equip.id var run data get storage cmd:var upgrade.a.abilityid
execute as @a[tag=choose-player] at @s run function cmd:player/abilities/equip/run


#RESETS
scoreboard players reset upgrade.lvl var
data remove storage cmd:var upgrade.path
data remove storage cmd:var upgrade.augment
data remove storage cmd:var upgrade.a.augment
