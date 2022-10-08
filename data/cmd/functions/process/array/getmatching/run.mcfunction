#IN - A [array -> cmd:process/array/getmatching = Array<Obj>], B [tag -> cmd:process/array/getmatching = NBT Obj] | array, search tag
#OUT - A [out -> cmd:process/array/getmatching = Array<Obj>], B (getmatching.out -> var), C [inverseout -> cmd:process/array/getmatching = Array<Obj>] | array of matching elements, array length, array of non-matching elements

#USE - finds all elements of (IN A) that match the search tag specified in (IN B), and returns them as an array in (OUT A). (OUT B) will return 1 if any matching elements are found, and 0 if not. the array of elements that do not match are returned in (OUT C).

#NOTE - (IN B) must be an object with at least 1 nbt tag (tag:{somedata:"example"})
#NOTE - (OUT A) has the elements in the same order as (IN A), just with the non-matching elements removed.

#NOTE - this process resets its inputs after use


#out init
data modify storage cmd:process/array/getmatching out set value []

#foreach loop
execute store result score getmatching.i var if data storage cmd:process/array/getmatching array[]
execute if score getmatching.i var matches 1.. run function cmd:process/array/getmatching/foreach

#SET OUTPUT
execute store result score getmatching.out var if data storage cmd:process/array/getmatching out[]
data modify storage cmd:process/array/getmatching inverseout set from storage cmd:process/array/getmatching array

#RESET
scoreboard players reset getmatching.i var
scoreboard players reset getmatching.keep var
data remove storage cmd:var find
data remove storage cmd:process/array/getmatching array
data remove storage cmd:process/array/getmatching tag
