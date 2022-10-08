

#set score
execute if score modify.stat var matches 1 run scoreboard players operation @s stat_power_mod = modify.set var
execute if score modify.stat var matches 2 run scoreboard players operation @s stat_prot_mod = modify.set var
execute if score modify.stat var matches 3 run scoreboard players operation @s stat_health_mod = modify.set var
execute if score modify.stat var matches 4 run scoreboard players operation @s stat_mspeed_mod = modify.set var
execute if score modify.stat var matches 5 run scoreboard players operation @s stat_focus_mod = modify.set var
execute if score modify.stat var matches 6 run scoreboard players operation @s stat_melee_mod = modify.set var
