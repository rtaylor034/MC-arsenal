
#IN - A(bars.cycleto.player -> var), | playerid, bars peice type
#OUT - (bars.cycleto.out -> var) | success
#AFFECTS [cmd:storage/bars -> array]

#USE - cycles array[] to the correct playerid specified in IN A. cycles array[0].bars[] to the correct bars type specified in IN B. OUT will return 1 if player specified in IN A is found, 0 if not.

#NOTE - this process can be used to only take 1 input and will only cycle to the inputs specified, but may be used to cycle to both inputs at the same time if needed.
#NOTE - input variables are reset after each use.

#DEVNOTE - Implementation seems possibly unfinished? Specifically with [B]

#ARRAY LENGTH -> (bars.cycleto.i)
execute store result score bars.cycleto.i var if data storage cmd:storage/bars array[]

#cycle to player
execute if score bars.cycleto.i var matches 1.. run function cmd:player/bars/array/cycleto/foreach
scoreboard players set bars.cycleto.out var 0
execute if score bars.cycleto.keep var matches 0 run scoreboard players set bars.cycleto.out var 1

#RESET
scoreboard players reset bars.cycleto.player var
scoreboard players reset bars.cycleto.i var
scoreboard players reset bars.cycleto.keep var
data remove storage cmd:var bars.find
