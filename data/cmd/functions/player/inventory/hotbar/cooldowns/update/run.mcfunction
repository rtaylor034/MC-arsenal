
#IN - (update.slot -> var) | ability slot
#OUT - N/A

#USE - Updates the cooldown display slot specified in (IN) on this player to time/20 + 1

#SLOT KEY
#1 - Drop
#2 - Swap
#3 - Sneak
#4 - Click


#find tracker and store ability data
function cmd:player/tracker/find/run
data modify storage cmd:var update.abilities set from entity @e[type=marker,tag=track,limit=1] data.abilities

#CYCLETO SLOT ABILITY
data modify storage cmd:process/array/cycleto array set from storage cmd:var update.abilities
execute store result storage cmd:process/array/cycleto tag.slot int 1 run scoreboard players get update.slot var
function cmd:process/array/cycleto/run
data modify storage cmd:var update.a set from storage cmd:process/array/cycleto out[0]

#store time
execute store result score update.time var run data get storage cmd:var update.a.time

#control get
data modify storage cmd:var update.types set from storage cmd:controls/abilities typeIdentities

execute if score update.slot var matches 1 run function cmd:player/inventory/hotbar/cooldowns/update/sub/drop
execute if score update.slot var matches 2 run function cmd:player/inventory/hotbar/cooldowns/update/sub/swap
execute if score update.slot var matches 3 run function cmd:player/inventory/hotbar/cooldowns/update/sub/sneak
execute if score update.slot var matches 4 run function cmd:player/inventory/hotbar/cooldowns/update/sub/click

#RESETS
function cmd:player/tracker/unfind/run
data remove storage cmd:var update
scoreboard players reset 20 var
scoreboard players reset update.time var
scoreboard players reset update.slot var
#data remove storage cmd:var a
#data remove storage cmd:var types
#data remove storage cmd:var update.type
#data remove storage cmd:var keybind
