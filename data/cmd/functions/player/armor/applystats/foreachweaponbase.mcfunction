
#DECRIMENT
scoreboard players remove applystats.i var 1

#store stat
execute store result score applystats.stat var run data get storage cmd:var statstore[0].id


#store value
execute store result score applystats.value var run data get storage cmd:var statstore[0].base

#ADD STATS
execute if score applystats.stat var matches 1 run scoreboard players operation @s weap_dmg_base += applystats.value var
execute if score applystats.stat var matches 2 run scoreboard players operation @s weap_aspeed_base += applystats.value var
execute if score applystats.stat var matches 3 run scoreboard players operation @s weap_energy_base += applystats.value var


#CYCLE
data modify storage cmd:var statstore append from storage cmd:var statstore[0]
data remove storage cmd:var statstore[0]
#LOOP
execute if score applystats.i var matches 1.. run function cmd:player/armor/applystats/foreachweaponbase
