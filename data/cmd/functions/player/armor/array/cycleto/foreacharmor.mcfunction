

#DECRIMENT
scoreboard players remove cycleto.i var 1

#INPUT INTO STORAGE NBT
execute store result storage cmd:var find int 1 run scoreboard players get armor.cycleto.type var

#CYCLE
data modify storage cmd:storage/armor array[0].armor append from storage cmd:storage/armor array[0].armor[0]
data remove storage cmd:storage/armor array[0].armor[0]

#COMPARE
execute store success score cycleto.keep var run data modify storage cmd:var find set from storage cmd:storage/armor array[0].armor[0].type


execute if score cycleto.i var matches 1.. unless score cycleto.keep var matches 0 run function cmd:player/armor/array/cycleto/foreacharmor
