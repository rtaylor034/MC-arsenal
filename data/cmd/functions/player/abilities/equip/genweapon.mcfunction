#CALL - equip/cycleability

#GET WEAPON
scoreboard players operation armor.cycleto.player var = @s playerid
function cmd:player/armor/array/cycleto/run
data modify storage cmd:var equip.weapInfo set from storage cmd:storage/armor array[0].weapon

#TRANSFER PATH AND AUGMENTS
data modify storage cmd:var equip.slots[0].weapon.path set from storage equip.weapInfo.path
data modify storage cmd:var equip.slots[0].weapon.augments set from storage equip.weapInfo.augments
