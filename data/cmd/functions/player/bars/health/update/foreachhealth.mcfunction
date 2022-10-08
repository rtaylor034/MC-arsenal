
#decriment
scoreboard players remove update.health var 1

#append
data modify storage cmd:var update.healthbar append value "|"


#loop
execute if score update.health var matches 1.. run function cmd:player/bars/health/update/foreachhealth
