

#DECRIMENT
scoreboard players remove getmatching.i var 1



#INPUT INTO STORAGE NBT
data modify storage cmd:var find set from storage cmd:process/array/getmatching array[0]

#COMPARE
execute store success score getmatching.keep var run data modify storage cmd:var find merge from storage cmd:process/array/getmatching tag

#add to array if found
execute if score getmatching.keep var matches 0 run data modify storage cmd:process/array/getmatching out append from storage cmd:process/array/getmatching array[0]


#CYCLE
execute unless score getmatching.keep var matches 0 run data modify storage cmd:process/array/getmatching array append from storage cmd:process/array/getmatching array[0]
data remove storage cmd:process/array/getmatching array[0]


execute if score getmatching.i var matches 1.. run function cmd:process/array/getmatching/foreach
