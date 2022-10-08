
#CALL - use/success/trackerdata



#ENERGY COST
execute store result score change.add var run data get storage cmd:var array[0].uses[0].energyCost
scoreboard players operation change.add var *= -1 const
function cmd:player/energy/change/run


#[DEPRICATED]
#Cycle energy
#data modify storage cmd:var array[0].energyCost append from storage cmd:var array[0].energyCost[0]
#data remove storage cmd:var array[0].energyCost[0]
