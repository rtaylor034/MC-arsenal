#CALL - genweapon

#DECRIMENT
scoreboard players remove equip.sub.i var 1

#APPLY PERCENT MODIFIERS
#foreach -> equip.weapInfo.augments[]
execute store result score equip.sub.j var if data storage cmd:var equip.weapInfo.augments[]
function cmd:player/abilities/equip/sub/foreachaug

#Store current stat id -> (equip.sub.currstat -> var)
execute store result score equip.sub.currstat var run data get storage cmd:var equip.slots[0].weapon.stats[0].id
#foreach -> equip.weapInfo.path[]
execute store result score equip.sub.j var if data storage cmd:var equip.weapInfo.path[]
function cmd:player/abilities/equip/sub/foreachpath


#CYCLE
data modify storage cmd:var equip.slots[0].weapon.stats append from storage cmd:var equip.slots[0].weapon.stats[0]
data remove storage cmd:var equip.slots[0].weapon.stats[0]


#LOOP
execute if score equip.sub.i var matches 1.. run function cmd:player/abilities/equip/sub/foreachstat
