

#DECRIMENT
scoreboard players remove cycleto.i var 1


#CYCLE
data modify storage cmd:process/array/cycleto array append from storage cmd:process/array/cycleto array[0]
data remove storage cmd:process/array/cycleto array[0]

#INPUT INTO STORAGE NBT
data modify storage cmd:var find set from storage cmd:process/array/cycleto array[0]

#COMPARE
execute store success score cycleto.keep var run data modify storage cmd:var find merge from storage cmd:process/array/cycleto tag


execute if score cycleto.i var matches 1.. unless score cycleto.keep var matches 0 run function cmd:process/array/cycleto/foreach
