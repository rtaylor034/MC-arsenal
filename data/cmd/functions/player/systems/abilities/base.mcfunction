
#CALL - tracker/base
#Called from all trackers

#NOTE - this tracker's corresponding player is tagged "found"

#entity data to storage
data modify storage cmd:var tracker.abilities set from entity @s data.abilities


#FOR EACH ABILITY IN ARRAY
execute store result score tracker.abilities.i var if data storage cmd:var tracker.abilities[]
execute if score tracker.abilities.i var matches 1.. run function cmd:player/systems/abilities/foreachability


#storage to entity data
data modify entity @s data.abilities set from storage cmd:var tracker.abilities

#RESETS
data remove storage cmd:var tracker.abilities
scoreboard players reset tracker.abilities.i var
scoreboard players reset tracker.abilities.time var
scoreboard players reset tracker.abilities.wait var
