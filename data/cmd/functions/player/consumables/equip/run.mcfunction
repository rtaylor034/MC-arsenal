
#IN - @s, A (equip.id -> var), B (equip.slot -> var) | consumable id, slot id
#OUT - A (equip.success -> var), B [equip.out -> cmd:var] | success?, Consumable Obj
#USE - equips the consumable specified in (IN A) to this player's tracker's consumable array to the slot specified in (IN B).

#NOTE - This searches for the consumable id in [array -> cmd:controls/consumables], and copies its data


#FIND TRACKER
function cmd:player/tracker/find/run

#reference var
data modify storage cmd:var equip.slots set from entity @e[type=minecraft:marker,tag=track,limit=1] data.consumables

#CYCLETO SLOT
data modify storage cmd:process/array/cycleto array set from storage cmd:var equip.slots
execute store result storage cmd:process/array/cycleto tag.slot int 1 run scoreboard players get equip.slot var
function cmd:process/array/cycleto/run
data modify storage cmd:var equip.slots set from storage cmd:process/array/cycleto out

#EQUIP ABILITY
#only runs if a valid slot was found in previous cycleto
execute if score cycleto.out var matches 1 run function cmd:player/consumables/equip/cycleconsumable


#OUT
scoreboard players operation equip.success var = cycleto.out var

#RESETS
function cmd:player/tracker/unfind/run
data remove storage cmd:var equip.slots
data remove storage cmd:var equip.c
