
#decriment
scoreboard players remove update.maxhealth var 1

#append
data modify storage cmd:var update.maxhealthbar append value "|"


#loop
execute if score update.maxhealth var matches 1.. run function cmd:player/bars/health/update/formaxhealth
