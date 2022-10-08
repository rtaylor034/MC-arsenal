
#DECRIMENT
scoreboard players remove applystats.i var 1

#store stat
execute store result score applystats.stat var run data get storage cmd:var weapon.stats[0]

#find upgrade value
data modify storage cmd:process/array/cycleto array set from storage cmd:templates/armor/controls statsPerUpgrade.weapon
data modify storage cmd:process/array/cycleto tag.id set from storage cmd:var weapon.stats[0]
function cmd:process/array/cycleto/run

#store value
execute store result score applystats.value var run data get storage cmd:process/array/cycleto out[0].value

#ADD STATS
execute if score applystats.stat var matches 1 run scoreboard players operation @s weap_dmg_base += applystats.value var
execute if score applystats.stat var matches 2 run scoreboard players operation @s weap_aspeed_base += applystats.value var
execute if score applystats.stat var matches 3 run scoreboard players operation @s weap_energy_base += applystats.value var


#CYCLE
data modify storage cmd:var weapon.stats append from storage cmd:var weapon.stats[0]
data remove storage cmd:var weapon.stats[0]
#LOOP
execute if score applystats.i var matches 1.. run function cmd:player/armor/applystats/foreachweaponstat
