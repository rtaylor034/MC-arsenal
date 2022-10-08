#CALL - from events/advancement/abilityslot/<swap, drop, sneak, weapon>/call
#FROM - this player
#PASS - (use.slot -> var) | slot id
#PASSTYPE - (read)
#DESC - Called whenever a player tries to use an ability. Regulates if an ability can actually be used or not.

#SLOT KEY
#1 - Drop
#2 - Swap
#3 - Sneak
#4 - Weapon Click

#FIND TRACKER
function cmd:player/tracker/find/run

#GET ABILITY OBJECT
data modify storage cmd:process/array/cycleto array set from entity @e[type=minecraft:marker,tag=track,limit=1] data.abilities
execute store result storage cmd:process/array/cycleto tag.slot int 1 run scoreboard players get use.slot var
function cmd:process/array/cycleto/run

#ref var "abilities"
data modify storage cmd:var abilities set from storage cmd:process/array/cycleto out

#nbt to score
execute store result score time var run data get storage cmd:var abilities[0].time 1
execute store result score ecost var run data get storage cmd:var abilities[0].uses[0].energyCost 1

#can use var
scoreboard players set ability.success var 1

#EVENT CALL: ability/use/oncooldown
execute if score time var matches 1.. run function cmd:player/events/ability/use/oncooldown/call

#EVENT CALL: ability/use/insufenergy
execute if score ability.success var matches 1 if score @s energy < ecost var run function cmd:player/events/ability/use/insufenergy/call

#EVENT CALL: ability/use/success
execute if score ability.success var matches 1 run function cmd:player/events/ability/use/success/call





#RESETS
function cmd:player/tracker/unfind/run
scoreboard players reset use.slot var
data remove storage cmd:var abilities
scoreboard players reset time var
scoreboard players reset ecost var
scoreboard players reset ability.success var
