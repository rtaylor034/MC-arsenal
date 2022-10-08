
#IN - @s, a (remove.id -> var), b (remove.range -> var) | effect stat, remove negative/positive/all effects
#OUT - [remove.out -> cmd:var = Array[Obj]] | array of removed effects
#USE - Removes stat effects from this player if they match the stat specified by (IN a). This will remove effects with an amount less than or equal to (IN b) if (IN b) is negative, and greater than or equal to if (IN b) is positive. if (IN b) is 0, then all matching effects will be removed.

#NOTE - more specifically, this process sets all effect's times specified by (IN) to 0, it does not actually remove them directly. this is to allow the effect's "zero" function to be called.
#NOTE - one or both of (IN a) and (IN b) must be specified. if (IN a) is not specified, it will remove effects based on the amount, regardless of stat. if (IN b) is not specified, it will be assumed 0.
#NOTE - can be called with no parameters to clear ALL stat effects.

#NOTE - this process resets input values after calling

#stat id key:
#1 = Power
#2 = Protection
#3 = Vitality
#4 = Movement Speed
#5 = Focus
#6 = Strength
#7 = Weapon Damage
#8 = Weapon Attack Speed
#9 = Weapon Max Energy

#reset out
data modify storage cmd:var remove.out set value []

#find tracker
function cmd:player/tracker/find/run

#manip var
data modify storage cmd:var remove.effects set from entity @e[type=minecraft:marker,tag=track,limit=1,sort=nearest] data.effects.stat

#for each effect
execute store result score remove.i var if data storage cmd:var remove.effects[]
execute if score remove.i var matches 1.. run function cmd:player/effects/stat/remove/foreacheffect

#set data
data modify entity @e[type=minecraft:marker,tag=track,limit=1,sort=nearest] data.effects.stat set from storage cmd:var remove.effects

#RESETS
function cmd:player/tracker/unfind/run
data remove storage cmd:var remove.effects
scoreboard players reset remove.id var
scoreboard players reset remove.range var
data remove storage cmd:var remove.name
data remove storage cmd:var remove.find
scoreboard players reset remove.keep var
scoreboard players reset remove.i var
scoreboard players reset remove.amount var
