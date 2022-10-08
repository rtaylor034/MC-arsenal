
#IN - @s, A1 [remove.name -> cmd:var = String], A2 (remove.type -> var) | effect name/identifier, effect type
#OUT - [remove.out -> cmd:var = Array[Obj]] | array of removed effects
#USE - Removes all effects from this player that match the name specified by (IN A1) or the type specified by (IN A2).

#NOTE - more specifically, this process sets all effect's times specified by (IN) to 0, it does not actually remove them directly. this is to allow the effect's "zero" function to be called.
#NOTE - this process resets input values after calling

#NOTE - types are for specifying is this effect beneficial or detrimental or neither to the player. examples: Stunned (Negative), Invulnerable (Positive), Channeling (Neutral)

#TYPE KEY
#0 = Neutral
#1 = Negative
#2 = Positive
#3 = Special

#reset out
data modify storage cmd:var remove.out set value []


#find tracker
function cmd:player/tracker/find/run

#manip var
data modify storage cmd:var remove.effects set from entity @e[type=minecraft:marker,tag=track,limit=1,sort=nearest] data.effects.status

#for each effect
execute store result score remove.i var if data storage cmd:var remove.effects[]
execute if score remove.i var matches 1.. run function cmd:player/effects/status/remove/foreacheffect

#set data
data modify entity @e[type=minecraft:marker,tag=track,limit=1,sort=nearest] data.effects.status set from storage cmd:var remove.effects

#RESETS
function cmd:player/tracker/unfind/run
data remove storage cmd:var remove.effects
scoreboard players reset remove.type var
data remove storage cmd:var remove.name
data remove storage cmd:var remove.find
scoreboard players reset remove.keep var
scoreboard players reset remove.i var
