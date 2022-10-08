
#CALL - systems/effects/stat/foreacheffect
#FROM - player that has the effect
#DESC - Called when the timer an effect reaches 0, reverses this effect's effect

execute if score effects.id var matches 1 run scoreboard players operation @s stat_power_mod += effects.amount var
execute if score effects.id var matches 2 run scoreboard players operation @s stat_prot_mod += effects.amount var
execute if score effects.id var matches 3 run scoreboard players operation @s stat_health_mod += effects.amount var
execute if score effects.id var matches 4 run scoreboard players operation @s stat_mspeed_mod += effects.amount var
execute if score effects.id var matches 5 run scoreboard players operation @s stat_focus_mod += effects.amount var
execute if score effects.id var matches 6 run scoreboard players operation @s stat_melee_mod += effects.amount var
execute if score effects.id var matches 7 run scoreboard players operation @s weap_dmg_mod += effects.amount var
execute if score effects.id var matches 8 run scoreboard players operation @s weap_aspeed_mod += effects.amount var
execute if score effects.id var matches 9 run scoreboard players operation @s weap_energy_mod += effects.amount var

#add tag
tag @s add statupdate
tag @s add attupdate

#REMOVE INFLICT
data remove storage cmd:var effects.stat[0].inflict
