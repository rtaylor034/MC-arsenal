#CALL - cycleability

#GET WEAPON
scoreboard players operation armor.cycleto.player var = @s playerid
function cmd:player/armor/array/cycleto/run
data modify storage cmd:var equip.weapInfo set from storage cmd:storage/armor array[0].weapon

#TRANSFER PATH AND AUGMENTS
data modify storage cmd:var equip.slots[0].weapon.path set from storage cmd:var equip.weapInfo.path
data modify storage cmd:var equip.slots[0].weapon.augments set from storage cmd:var equip.weapInfo.augments

#STAT MODIFIERS
#foreach -> equip.slots[0].weapon.stats[]
execute store result score equip.sub.i var if data storage cmd:var equip.slots[0].weapon.stats[]
function cmd:player/abilities/equip/sub/foreachstat


#RESET
scoreboard players reset equip.sub.pval var
scoreboard players reset equip.sub.pmult var
scoreboard players reset equip.sub.j var
scoreboard players reset equip.sub.i var
data remove storage cmd:var equip.weapInfo
