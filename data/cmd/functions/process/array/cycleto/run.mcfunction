#IN - A [array -> cmd:process/array/cycleto = Array<Obj>], B[tag -> cmd:process/array/cycleto = NBT Obj] | array, search tag
#OUT - A [out -> cmd:process/array/cycleto = Array<Obj>] B (cycleto.out -> var) | cycled array, success

#USE - cycles the (IN A) array to the matching tag specified in (IN B) using data merge and stores it in (OUT A). (OUT B) will return 1 if an object with a matching id is found, and return 0 if its not.

#NOTE - (IN B) must be an object with at least 1 nbt tag (tag:{somedata:"example"})

#NOTE - this process resets its inputs after use

#ARRAY LENGTH -> (cycleto.i)
execute store result score cycleto.i var if data storage cmd:process/array/cycleto array[]

#cycle to object
execute if score cycleto.i var matches 1.. run function cmd:process/array/cycleto/foreach
scoreboard players set cycleto.out var 0
execute if score cycleto.keep var matches 0 run scoreboard players set cycleto.out var 1

#SET OUTPUT
data modify storage cmd:process/array/cycleto out set from storage cmd:process/array/cycleto array

#RESET
scoreboard players reset cycleto.i var
scoreboard players reset cycleto.keep var
data remove storage cmd:var find
data remove storage cmd:process/array/cycleto array
data remove storage cmd:process/array/cycleto tag
