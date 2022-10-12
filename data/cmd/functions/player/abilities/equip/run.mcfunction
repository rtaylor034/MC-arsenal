
#IN - @s, A (equip.id -> var), B (equip.slot -> var) | ability id, slot id
#OUT - A (equip.out -> var), B [equip.name -> cmd:var ; String], C [equip.replaced -> cmd:var ; Player Ability Obj] | success?, ability name, replaced abili

#USE - equips the ability specified in (IN A) to this player's tracker's ability array to the slot specified in (IN B).

#NOTE - This searches for the ability id in [array -> cmd:controls/abilities], and copies its data


#FIND TRACKER
function cmd:player/tracker/find/run

#reference var
data modify storage cmd:var equip.slots set from entity @e[type=minecraft:marker,tag=track,limit=1] data.abilities

#CYCLETO SLOT
data modify storage cmd:process/array/cycleto array set from storage cmd:var equip.slots
execute store result storage cmd:process/array/cycleto tag.slot int 1 run scoreboard players get equip.slot var
function cmd:process/array/cycleto/run
data modify storage cmd:var equip.slots set from storage cmd:process/array/cycleto out

#replaced out
data modify storage cmd:var equip.replaced set from storage cmd:var equip.slots[0]

#EQUIP ABILITY
#only runs if a valid slot was found in previous cycleto
execute if score cycleto.out var matches 1 run function cmd:player/abilities/equip/cycleability


#OUT
scoreboard players operation equip.out var = cycleto.out var

#RESETS
function cmd:player/tracker/unfind/run
data remove storage cmd:var equip.slots
data remove storage cmd:var equip.a
