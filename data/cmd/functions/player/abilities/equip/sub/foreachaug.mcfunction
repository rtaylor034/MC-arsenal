#CALL - foreachstat

#DECRIMENT
scoreboard players remove equip.sub.j var 1

#Get augment
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/weapons augments
data modify storage cmd:process/array/cycleto tag.id set from storage cmd:var equip.weapInfo.augments[0]
function cmd:process/array/cycleto/run

#Get statmods
data modify storage cmd:process/array/cycleto array set from storage cmd:process/array/cycleto out[0].statMods
data modify storage cmd:process/array/cycleto tag.id set from storage cmd:var equip.a.weapon.stats[0].id
function cmd:process/array/cycleto/run

#Get augment stat multiplayer -> equip.sub.pmult
execute store result score equip.sub.pmult var run data get storage cmd:process/array/cycleto out[0].percent
function cmd:player/abilities/equip/sub/applypercent

#CYCLE
data modify storage cmd:var equip.weapInfo.path append from storage cmd:var equip.weapInfo.path[0]
data remove storage cmd:var equip.weapInfo.path[0]


#LOOP
execute if score equip.sub.j var matches 1.. run function cmd:player/abilities/equip/sub/foreachpath
