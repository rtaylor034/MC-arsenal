
#decriment
scoreboard players remove update.change var 1

#append
data modify storage cmd:var update.changebar append value "|"

#loop
execute if score update.change var matches 1.. run function cmd:player/bars/health/update/foreachchange
