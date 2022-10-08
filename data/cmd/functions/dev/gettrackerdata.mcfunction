
#shows you your tracker data

function cmd:player/tracker/find/run
tellraw @s ["","\n",{"nbt":"data","entity":"@e[type=minecraft:marker,tag=track,limit=1]","color":"gray"}]
function cmd:player/tracker/unfind/run
