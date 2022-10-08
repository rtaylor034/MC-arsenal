
#IN - (get.id -> var) | consumable ID
#IN ALT - A (get.playerid -> var), B (get.slot -> var) | playerid, consumable slot
#OUT - A [get.item -> cmd:var = Item Obj], B (get.success -> var), C (get.cost -> var) | Consumable Item, success, the cost of this consumable

#USE - parses the consumable info for the consumable specified in (IN) and returns it as an item in (OUT A). returns the "consumable item". (OUT B) returns 1 if an consumable with the ID specified in (IN) is found, 0 if not
#ALT USE - gets the consumable that is equipped in slot (IN B) on player specified in (IN A), and returns the consumable item in (OUT A). (OUT B) will return 1 if the player is found, and has a valid consumable in the slot, 0 otherwise.

#NOTE - uses the main consumable array from [array -> cmd:controls/consumables]
#NOTE - this process returns the standard "consumable item" that this consumable should have.

#NOTE - this process resets (IN) values

#out init
scoreboard players set get.success var 1

#IN ALT
execute if score get.playerid var matches 0.. run function cmd:consumable/item/get/findconsumable

#cycleto consumable
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/consumables array
execute store result storage cmd:process/array/cycleto tag.id int 1 run scoreboard players get get.id var
function cmd:process/array/cycleto/run
execute if score get.success var matches 1 run scoreboard players operation get.success var = cycleto.out var

#ref var (get.a)
data modify storage cmd:var get.a set from storage cmd:process/array/cycleto out[0]

#out set
execute store result score get.cost var run data get storage cmd:var get.a.buyCost
data remove storage cmd:var get.item
execute if score get.success var matches 1 run function cmd:consumable/item/get/parse

#EMPTY SLOT
execute unless score get.success var matches 1 run function cmd:consumable/item/get/empty



#RESETS
execute as @a[tag=get-found,limit=1,sort=nearest] at @s run function cmd:player/tracker/unfind/run
tag @a remove get-found
scoreboard players reset get.id var
scoreboard players reset get.offset var
scoreboard players reset get.slot var
scoreboard players reset get.playerid var
data remove storage cmd:var get.a
