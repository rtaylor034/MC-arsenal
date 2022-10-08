
#CALL - tracker/base
#Called from all trackers

#NOTE - this tracker's corresponding player is tagged "found"


#entity data to storage
data modify storage cmd:var effects set from entity @s data.effects


#FOR EACH STAT EFFECT
execute store result score effects.i var if data storage cmd:var effects.stat[]
execute if score effects.i var matches 1.. run function cmd:player/systems/effects/stat/foreacheffect

#FOR EACH STATUS EFFECT
execute store result score effects.i var if data storage cmd:var effects.status[]
execute if score effects.i var matches 1.. run function cmd:player/systems/effects/status/foreacheffect



#storage to entity data
data modify entity @s data.effects set from storage cmd:var effects

#RESETS
data remove storage cmd:var effects
scoreboard players reset effects.i var
scoreboard players reset effects.time var
scoreboard players reset effects.inflict var
scoreboard players reset effects.amount var
data remove storage cmd:var e
scoreboard players reset check var
