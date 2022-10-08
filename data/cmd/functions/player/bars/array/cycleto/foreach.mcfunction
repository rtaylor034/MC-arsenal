

#DECRIMENT
scoreboard players remove bars.cycleto.i var 1

#INPUT INTO STORAGE NBT
execute store result storage cmd:var bars.find int 1 run scoreboard players get bars.cycleto.player var

#CYCLE
data modify storage cmd:storage/bars array append from storage cmd:storage/bars array[0]
data remove storage cmd:storage/bars array[0]

#COMPARE
execute store success score bars.cycleto.keep var run data modify storage cmd:var bars.find set from storage cmd:storage/bars array[0].playerid


execute if score bars.cycleto.i var matches 1.. unless score bars.cycleto.keep var matches 0 run function cmd:player/bars/array/cycleto/foreach
