#CALL - foreachstat

#DECRIMENT
scoreboard players remove equip.sub.j var 1

#Get percent ratio
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/weapons pathRatios
data modify storage cmd:process/array/cycleto tag.id set from storage cmd:var equip.weapInfo.path[0]
function cmd:process/array/cycleto/run

#Get melee/ranged multiplier -> equip.sub.pmult
execute unless data storage cmd:var equip.a.weapon.ranged store result score equip.sub.pmult var run data get storage cmd:process/array/cycleto out[0].percent[0]
execute if data storage cmd:var equip.a.weapon.ranged store result score equip.sub.pmult var run data get storage cmd:process/array/cycleto out[0].percent[1]

#/this is not effecient, it would be better to loop through the path[] array and apply each one to the stat array instead of looping through the stat array and checking every path[] element each time.
#apply percentage mods (if pathid = currentstat)
execute store result score equip.sub.pathid var run data get storage cmd:var equip.weapInfo.path[0]
execute if score equip.sub.pathid var = equip.currstat var run function cmd:player/abilities/equip/sub/applypercent

#CYCLE
data modify storage cmd:var equip.weapInfo.path append from storage cmd:var equip.weapInfo.path[0]
data remove storage cmd:var equip.weapInfo.path[0]


#LOOP
execute if score equip.sub.j var matches 1.. run function cmd:player/abilities/equip/sub/foreachpath
