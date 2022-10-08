#IN - A [array -> cmd:process/array/mergetoall = Array<Obj>], B [tag -> cmd:process/array/mergetoall = NBT] | array, nbt to merge
#IN OPT - c [condition -> cmd:process/array/mergetoall = NBT Obj], d [exception -> cmd:process/array/mergetoall = NBT Obj] | conditional nbt tag, exception nbt tag
#OUT - [out -> cmd:process/array/mergetoall = Array<Obj>] | array with added tags

#USE - merges nbt specified in (IN B) to all elements in (IN A) and returns the array in (OUT). if (IN c) is specified, this process will only merge to elements matching nbt with (IN c). if (IN d) is specified, this process will NOT merge to elements matching nbt with (IN d).

#NOTE - IN B must be an object with at least 1 nbt tag (tag:{somedata:"example"})
#NOTE - this process resets its inputs after use
#NOTE - (IN c) works like "tag" in cycleto

#FOREACH
execute store result score mergetoall.i var if data storage cmd:process/array/mergetoall array[]
execute if score mergetoall.i var matches 1.. run function cmd:process/array/mergetoall/foreach

#SET OUTPUT
data modify storage cmd:process/array/mergetoall out set from storage cmd:process/array/mergetoall array

#RESET
scoreboard players reset mergetoall.i var
scoreboard players reset mergetoall.keep var
scoreboard players reset mergetoall.proceed var
data remove storage cmd:process/array/mergetoall array
data remove storage cmd:process/array/mergetoall tag
data remove storage cmd:process/array/mergetoall condition
data remove storage cmd:process/array/mergetoall temp
data remove storage cmd:process/array/mergetoall exception
