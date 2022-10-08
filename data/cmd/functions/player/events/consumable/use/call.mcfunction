
#CALL - from events/action/rodclick/call
#FROM - this player
#PASS - (consumable.id -> var) | id of the consumable used
#PASSTYPE - (read)
#DESC - Called when this player uses a consumable.

#get consumable object
execute store result storage cmd:process/array/cycleto tag.id int 1 run scoreboard players get consumable.id var
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/consumables array
function cmd:process/array/cycleto/run
data modify storage cmd:var consumable.object set from storage cmd:process/array/cycleto out[0]


tellraw @a ["",{"selector":"@s"},{"text":" just consumed ","color":"gray"},{"nbt":"consumable.object.name","storage":"cmd:var","color":"white"},{"text":" | id:","color":"red"},{"nbt":"consumable.object.id","storage":"cmd:var","color":"gold"}]





#RESET
scoreboard players reset consumable.id var
data remove storage cmd:var consumable
