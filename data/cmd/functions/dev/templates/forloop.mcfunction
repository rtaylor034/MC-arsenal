

#DECRIMENT
scoreboard players remove i var 1



#CYCLE
data modify storage cmd:var array append from storage cmd:var array[0]
data remove storage cmd:var array[0]


#LOOP
execute if score i var matches 1.. run function cmd:
