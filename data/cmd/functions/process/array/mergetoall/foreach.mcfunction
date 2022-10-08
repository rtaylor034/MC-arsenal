

#DECRIMENT
scoreboard players remove mergetoall.i var 1

#ADD TAG
scoreboard players set mergetoall.proceed var 1
execute if data storage cmd:process/array/mergetoall condition run function cmd:process/array/mergetoall/condition
execute if data storage cmd:process/array/mergetoall exception run function cmd:process/array/mergetoall/exception
execute if score mergetoall.proceed var matches 1 run data modify storage cmd:process/array/mergetoall array[0] merge from storage cmd:process/array/mergetoall tag


#CYCLE
data modify storage cmd:process/array/mergetoall array append from storage cmd:process/array/mergetoall array[0]
data remove storage cmd:process/array/mergetoall array[0]

#LOOP
execute if score mergetoall.i var matches 1.. run function cmd:process/array/mergetoall/foreach
