


#CYCLETO SLOT
data modify storage cmd:process/array/cycleto array set from storage cmd:var unequip.slots
execute store result storage cmd:process/array/cycleto tag.slot int 1 run scoreboard players get unequip.slot var
function cmd:process/array/cycleto/run
data modify storage cmd:var unequip.slots set from storage cmd:process/array/cycleto out

#OUT
execute store success score unequip.success var if data storage cmd:var unequip.slots[0].id
data modify storage cmd:var unequip.out set from storage cmd:var unequip.slots[0]
execute if score cycleto.out var matches 0 run scoreboard players set unequip.success var 0

#UNEQUIP
execute if score unequip.success var matches 1 run data modify storage cmd:var unequip.slots[0] set value {slot:0}
execute if score unequip.success var matches 1 run execute store result storage cmd:var unequip.slots[0].slot int 1 run scoreboard players get unequip.slot var
