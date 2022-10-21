#CALL - cycleability

#ref (equip.slots[0] -> equip.a)
data modify storage cmd:var equip.a set from storage cmd:var equip.slots[0]

#GET WEAPON
scoreboard players operation armor.cycleto.player var = @s playerid
function cmd:player/armor/array/cycleto/run
data modify storage cmd:var equip.weapInfo set from storage cmd:storage/armor array[0].weapon

#TRANSFER PATH AND AUGMENTS
data modify storage cmd:var equip.a.weapon.path set from storage cmd:var equip.weapInfo.path
data modify storage cmd:var equip.a.weapon.augments set from storage cmd:var equip.weapInfo.augments

#STAT MODIFIERS
#foreach -> equip.a.weapon.stats[]
execute store result score equip.sub.i var if data storage cmd:var equip.a.weapon.stats[]
function cmd:player/abilities/equip/sub/foreachstat

#GENERATE uses[] ARRAY
execute unless data storage cmd:var equip.a.weapon.ranged run function cmd:player/abilities/equip/meleeuses
execute if data storage cmd:var equip.a.weapon.ranged run function cmd:player/abilities/equip/rangeduses

#ref setback (equip.a -> equip.slots[0])
data modify storage cmd:var equip.slots[0] set from storage cmd:var equip.a

#RESET
scoreboard players reset equip.sub.currstat var
scoreboard players reset equip.sub.pathid var
scoreboard players reset equip.sub.pval var
scoreboard players reset equip.sub.pmult var
scoreboard players reset equip.sub.j var
scoreboard players reset equip.sub.i var
data remove storage cmd:var equip.weapInfo
