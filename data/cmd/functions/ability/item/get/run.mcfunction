
#IN - (get.id -> var) | ability ID
#IN OPT - (get.keybindslot -> var) | keybind display slot
#IN ALT - A (get.playerid -> var), B (get.slot -> var) | playerid, ability slot
#OUT - A [get.item -> cmd:var = Item Obj], B (get.success -> var), c (get.keysuffix -> var)| Ability Item, success, slot keybind suffix ("<Keybind>")

#USE - parses the ability info for the ability specified in (IN) and returns it as an item in (OUT A). returns the "ability item". (OUT B) returns 1 if an ability with the ID specified in (IN) is found, 0 if not. (OUT c) returns the json text of the suffix of the keybind relating to the slot specified in (IN ALT B) or (IN OPT).
#ALT USE - gets the ability that is equipped in slot (IN B) on player specified in (IN A), and returns the ability item in (OUT A). (OUT B) will return 1 if the player is found, and has a valid ability in the slot, 0 otherwise.

#NOTE - uses the main ability array from [array -> cmd:controls/abilities] (For non IN ALT).
#NOTE - this process returns the standard "ability item" that this ability should have.

#NOTE - this process resets (IN) values


#out init
scoreboard players set get.success var 1
execute if score get.slot var matches 1.. run scoreboard players operation get.keybindslot var = get.slot var

#SLOT IDENTITY
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/abilities slotIdentities
execute store result storage cmd:process/array/cycleto tag.slot int 1 run scoreboard players get get.keybindslot var
function cmd:process/array/cycleto/run
execute if score cycleto.out var matches 1.. run function cmd:ability/item/get/keysuffix


#IN ALT
execute if score get.playerid var matches 0.. run function cmd:ability/item/get/findability

#cycleto ability
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/abilities array
execute store result storage cmd:process/array/cycleto tag.id int 1 run scoreboard players get get.id var
function cmd:process/array/cycleto/run
execute if score get.success var matches 1 run scoreboard players operation get.success var = cycleto.out var

#ref var (get.a) (already set if IN ALT was specified)
execute unless data storage cmd:var get.a. run data modify storage cmd:var get.a set from storage cmd:process/array/cycleto out[0]

#out set
data remove storage cmd:var get.item
execute unless data storage cmd:var get.a.weapon if score get.success var matches 1 run function cmd:ability/item/get/parse
execute if data storage cmd:var get.a.weapon if score get.success var matches 1 run function cmd:ability/item/get/sub/weaponparse
execute unless score get.success var matches 1 run data modify storage cmd:var get.item set value {Count:1b, id:"minecraft:stone", tag:{display:{Name:'{"text":"MISSING ABILITY"}'}}}




#RESETS
execute as @a[tag=get-found,limit=1,sort=nearest] at @s run function cmd:player/tracker/unfind/run
tag @a remove get-found
scoreboard players reset get.id var
scoreboard players reset get.offset var
scoreboard players reset get.slot var
scoreboard players reset get.playerid var
scoreboard players reset get.keybindslot var
scoreboard players reset get.uses
scoreboard players reset get.use
data remove storage cmd:var get.a
