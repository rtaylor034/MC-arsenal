
#decriment
scoreboard players remove update.shield var 1

#append
data modify storage cmd:var update.shieldbar append value "|"


#loop
execute if score update.shield var matches 1.. run function cmd:player/bars/health/update/foreachshield
