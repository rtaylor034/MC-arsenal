

#INPUT INTO STORAGE NBT
data modify storage cmd:process/array/mergetoall temp.find set from storage cmd:process/array/mergetoall array[0]

#COMPARE
execute store success score mergetoall.keep var run data modify storage cmd:process/array/mergetoall temp.find merge from storage cmd:process/array/mergetoall condition

#set proceed to 0 if not matching
execute unless score mergetoall.keep var matches 0 run scoreboard players set mergetoall.proceed var 0
