

#return
execute if score modify.stat var matches 1 run scoreboard players operation modify.out var = @s stat_power_mod
execute if score modify.stat var matches 2 run scoreboard players operation modify.out var = @s stat_prot_mod
execute if score modify.stat var matches 3 run scoreboard players operation modify.out var = @s stat_health_mod
execute if score modify.stat var matches 4 run scoreboard players operation modify.out var = @s stat_mspeed_mod
execute if score modify.stat var matches 5 run scoreboard players operation modify.out var = @s stat_focus_mod
execute if score modify.stat var matches 6 run scoreboard players operation modify.out var = @s stat_melee_mod
