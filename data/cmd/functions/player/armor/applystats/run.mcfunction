
#IN - (@s -> playerid) | playerid
#OUT - N/A | AFFECTS (stat_<stats>_base -> @s)

#USE - Call on a player to apply their armor's stats to their base stat scores. Also adds all armor/weapon passives to the players tracker.

#NOTE - Resets all base stats of a player beforehand


#find tracker/store data
function cmd:player/tracker/find/run
execute as @e[type=marker,tag=track] run data modify storage cmd:var applystats.passives set from entity @s data.passives

#get armor array
scoreboard players operation armor.cycleto.player var = @s playerid
function cmd:player/armor/array/cycleto/run
data modify storage cmd:var armor set from storage cmd:storage/armor array[0].armor
data modify storage cmd:var weapon set from storage cmd:storage/armor array[0].weapon


#reset stats
scoreboard players set @s stat_power_base 0
scoreboard players set @s stat_prot_base 0
scoreboard players set @s stat_health_base 0
scoreboard players set @s stat_mspeed_base 0
scoreboard players set @s stat_focus_base 0
scoreboard players set @s stat_melee_base 0

scoreboard players set @s weap_dmg_base 0
scoreboard players set @s weap_aspeed_base 0
scoreboard players set @s weap_energy_base 0

#reset passives array
data modify storage cmd:var applystats.passives set value {armor:[],weapon:0}

#TAG
tag @s add statupdate

#for each armor peice
execute store result score applystats.i var if data storage cmd:var armor[]
execute if score applystats.i var matches 1.. run function cmd:player/armor/applystats/foreacharmor

#for each weapon stat
execute store result score applystats.i var if data storage cmd:var weapon.stats[]
execute if score applystats.i var matches 1.. run function cmd:player/armor/applystats/foreachweaponstat

#Weapon passive
data modify storage cmd:var applystats.passives.weapon set from storage cmd:var weapon.passiveid

#for each weapon (base stats)
data modify storage cmd:var statstore set from storage cmd:templates/armor/controls statsPerUpgrade.weapon
execute store result score applystats.i var if data storage cmd:var statstore[]
execute if score applystats.i var matches 1.. run function cmd:player/armor/applystats/foreachweaponbase

#tracker data
data modify entity @e[type=marker,tag=track,limit=1] data.passives set from storage cmd:var applystats.passives

#RESETS
data remove storage cmd:var armor
data remove storage cmd:var applystats
data remove storage cmd:var weapon
data remove storage cmd:var statstore
scoreboard players reset applystats.i var
scoreboard players reset applystats.j var
scoreboard players reset applystats.stat var
scoreboard players reset applystats.value var
scoreboard players reset applystats.passiveid var
function cmd:player/tracker/unfind/run
