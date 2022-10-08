
#checks if each ability has an ID

execute unless data storage cmd:var tdata.abilities[0].id run scoreboard players set check.success var 0

#LOOP
data remove storage cmd:var tdata.abilities[0]
execute if score check.success var matches 1 if data storage cmd:var tdata.abilities[] run function cmd:player/game/ready/check/foreachability
