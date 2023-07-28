
#SCORES
#general
scoreboard objectives add playerid dummy
scoreboard objectives add var dummy
scoreboard objectives add const dummy
scoreboard objectives add playerstate dummy
scoreboard objectives add team dummy
scoreboard objectives add GAME dummy
scoreboard objectives add prep_ready dummy

#for trackers/bars, fixes stacked find calls
scoreboard objectives add trackcount dummy

#BARS
scoreboard objectives add barstack dummy
#scoreboard objectives add bar_health_timer dummy

#CURRENCY
#ability
scoreboard objectives add currency_c dummy
#armor
scoreboard objectives add currency_t dummy


#STATS
#(in order of their id)
#base
scoreboard objectives add stat_power_base dummy
scoreboard objectives add stat_prot_base dummy
scoreboard objectives add stat_health_base dummy
scoreboard objectives add stat_mspeed_base dummy
scoreboard objectives add stat_focus_base dummy
scoreboard objectives add stat_melee_base dummy
#mod
scoreboard objectives add stat_power_mod dummy
scoreboard objectives add stat_prot_mod dummy
scoreboard objectives add stat_health_mod dummy
scoreboard objectives add stat_mspeed_mod dummy
scoreboard objectives add stat_focus_mod dummy
scoreboard objectives add stat_melee_mod dummy
#final/usable
scoreboard objectives add stat_power dummy
scoreboard objectives add stat_prot dummy
scoreboard objectives add stat_health dummy
scoreboard objectives add stat_mspeed dummy
scoreboard objectives add stat_focus dummy
scoreboard objectives add stat_melee dummy


#WEAPON STATS
scoreboard objectives add weap_dmg_base dummy
scoreboard objectives add weap_aspeed_base dummy
scoreboard objectives add weap_energy_base dummy
#mod
scoreboard objectives add weap_dmg_mod dummy
scoreboard objectives add weap_aspeed_mod dummy
scoreboard objectives add weap_energy_mod dummy
#final
scoreboard objectives add weap_dmg dummy
scoreboard objectives add weap_aspeed dummy
scoreboard objectives add weap_energy dummy


#TIMERS
scoreboard objectives add melee_timer dummy
scoreboard objectives add energy_timer dummy
#for decimal values of energy regen
scoreboard objectives add energy_rstore dummy

#PLAYER
#health sheild energy
scoreboard objectives add max_health dummy
scoreboard objectives add health dummy
scoreboard objectives add shield dummy
scoreboard objectives add energy dummy
scoreboard objectives add max_energy dummy
scoreboard objectives add energy_rate dummy


#DYNAMIC CRITERIA
#hunger
scoreboard objectives add FOOD food
#drop detect
scoreboard objectives add drop minecraft.custom:minecraft.drop
#rodclick detect
scoreboard objectives add rodclick minecraft.used:minecraft.carrot_on_a_stick


#FUNCTIONS
function cmd:controls/loadall
function cmd:player/armor/array/templates


#SIGN PARSING
setblock 0 0 0 oak_sign
data modify block 0 0 0 front_text.messages set value ['{"text":""}','{"text":""}','{"text":""}','{"text":""}']
forceload add 0 0

#MESSAGE
tellraw @a {"color":"gray","text":"Cool Game - Loaded"}

#GAMERULES
gamerule doLimitedCrafting true

#CONSTANTS
scoreboard players set -1 const -1
scoreboard players set 100 const 100
scoreboard players set 2 const 2
scoreboard players set 20 const 20
