
#DECRIMENT
scoreboard players remove applystats.j var 1

#store stat
execute store result score applystats.stat var run data get storage cmd:var armor[0].stats[0]

#ADD STATS
execute if score applystats.stat var matches 1 run scoreboard players operation @s stat_power_base += applystats.value var
execute if score applystats.stat var matches 2 run scoreboard players operation @s stat_prot_base += applystats.value var
execute if score applystats.stat var matches 3 run scoreboard players operation @s stat_health_base += applystats.value var
execute if score applystats.stat var matches 4 run scoreboard players operation @s stat_mspeed_base += applystats.value var
execute if score applystats.stat var matches 5 run scoreboard players operation @s stat_focus_base += applystats.value var
execute if score applystats.stat var matches 6 run scoreboard players operation @s stat_melee_base += applystats.value var

#CYCLE
data modify storage cmd:var armor[0].stats append from storage cmd:var armor[0].stats[0]
data remove storage cmd:var armor[0].stats[0]
#LOOP
execute if score applystats.j var matches 1.. run function cmd:player/armor/applystats/foreachstat
