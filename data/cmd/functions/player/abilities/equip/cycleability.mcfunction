#CALL - run

#CYCLETO ABILITY
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/abilities array
execute store result storage cmd:process/array/cycleto tag.id int 1 run scoreboard players get equip.id var
function cmd:process/array/cycleto/run
data modify storage cmd:var equip.a set from storage cmd:process/array/cycleto out[0]
scoreboard players operation equip.out var = cycleto.out var

#WEAPON GENERATION
execute if data storage cmd:var equip.a.weapon run function cmd:player/abilities/equip/genweapon

#EQUIP
execute if score equip.out var matches 1 run data modify storage cmd:var equip.slots[0] merge from storage cmd:var equip.a
#/quick and dirty fix for hanging weapon data. not expandable - put all potentially hanging data under 1 object to make expandable.
execute unless data storage cmd:var equip.a.weapon run data remove storage cmd:var equip.slots[0].weapon

#PUT ONTO TRACKER
data modify entity @e[type=minecraft:marker,tag=track,limit=1] data.abilities set from storage cmd:var equip.slots
