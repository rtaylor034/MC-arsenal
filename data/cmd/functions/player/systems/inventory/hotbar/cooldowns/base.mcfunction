
#CALL - systems/inventory/base
#Called from all players every tick

#store tracker data
function cmd:player/tracker/find/run
data modify storage cmd:var cooldowns.abilities set from entity @e[type=marker,tag=track,limit=1] data.abilities

#FOR EACH ABILITY
execute store result score cooldowns.i var if data storage cmd:var cooldowns.abilities[]
execute if score cooldowns.i var matches 1.. run function cmd:player/systems/inventory/hotbar/cooldowns/foreachability


#RESETS
function cmd:player/tracker/unfind/run
data remove storage cmd:var cooldowns
scoreboard players reset cooldowns.i var
scoreboard players reset cooldowns.seconds var
scoreboard players reset cooldowns.count var
scoreboard players reset cooldowns.time var
scoreboard players reset cooldowns.itemmatch var
