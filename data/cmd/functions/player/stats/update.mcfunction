#Called on all players with the tag "statupdate"

#DESC - add the tag "statupdate" to any player whenever their base or mod stats can change.
#DESC - this function adds the base and mod stats of a player and stores it in their final usable stat values

#NOTE - this method may be called manually if changes need to take effect on same tick





#BASE STATS
scoreboard players operation @s stat_power = @s stat_power_base
scoreboard players operation @s stat_prot = @s stat_prot_base
scoreboard players operation @s stat_health = @s stat_health_base
scoreboard players operation @s stat_mspeed = @s stat_mspeed_base
scoreboard players operation @s stat_focus = @s stat_focus_base
scoreboard players operation @s stat_melee = @s stat_melee_base

scoreboard players operation @s weap_dmg = @s weap_dmg_base
scoreboard players operation @s weap_aspeed = @s weap_aspeed_base
scoreboard players operation @s weap_energy = @s weap_energy_base

#ARMOR ADD
scoreboard players operation @s stat_power += @s stat_power_mod
scoreboard players operation @s stat_prot += @s stat_prot_mod
scoreboard players operation @s stat_health += @s stat_health_mod
scoreboard players operation @s stat_mspeed += @s stat_mspeed_mod
scoreboard players operation @s stat_focus += @s stat_focus_mod
scoreboard players operation @s stat_melee += @s stat_melee_mod

#WEAPON ADD
scoreboard players operation @s weap_dmg += @s weap_dmg_mod
scoreboard players operation @s weap_aspeed += @s weap_aspeed_mod
scoreboard players operation @s weap_energy += @s weap_energy_mod

#MAX HEALTH
function cmd:player/stats/maxhealthcalc


#MAX ENERGY
#(currently) "max_energy" is basically just a reference variable to "weap_energy". this is just to enhance readability and allow for changes if they need to happen
#do NOT change max_energy directly from any other function, change "weap_energy_base", or "weap_energy_mod"
scoreboard players operation @s max_energy = @s weap_energy

#ENERGY RATE
#(currently) "energy_rate" is ONLY dependent on [energy.baseRate -> cmd:controls/stats] and does not scale with anything
execute store result score @s energy_rate run data get storage cmd:controls/stats energy.baseRate 1

#STRENGTH TO MELEE
function cmd:player/stats/strengthcalc

#REMOVE TAG
tag @s remove statupdate
