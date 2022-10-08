


#CYCLETO ABILITY
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/consumables array
execute store result storage cmd:process/array/cycleto tag.id int 1 run scoreboard players get equip.id var
function cmd:process/array/cycleto/run
data modify storage cmd:var equip.c set from storage cmd:process/array/cycleto out[0]

#EQUIP
execute if score cycleto.out var matches 1 run data modify storage cmd:var equip.slots[0] merge from storage cmd:var equip.c

#OUT SET
execute if score cycleto.out var matches 1 run data modify storage cmd:var equip.out set from storage cmd:var equip.c

#PUT ONTO TRACKER
data modify entity @e[type=minecraft:marker,tag=track,limit=1] data.consumables set from storage cmd:var equip.slots
