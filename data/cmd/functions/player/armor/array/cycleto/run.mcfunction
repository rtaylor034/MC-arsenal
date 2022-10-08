
#IN - A(armor.cycleto.player -> var), B(armor.cycleto.type) | playerid, armor peice type
#OUT - (armor.cycleto.out -> var) | success | AFFECTS [cmd:storage/armor -> array]
#USE - cycles array[] to the correct playerid specified in IN A. cycles array[0].armor[] to the correct armor type specified in IN B. OUT will return 1 if player specified in IN A is found, 0 if not.

#NOTE - this process can be used to only take 1 input and will only cycle to the inputs specified, but may be used to cycle to both inputs at the same time if needed.
#NOTE - input variables are reset after each use.

#ARRAY LENGTH -> (cycleto.i)
execute store result score cycleto.i var if data storage cmd:storage/armor array[]

#cycle to player
execute if score armor.cycleto.player var matches 1.. if score cycleto.i var matches 1.. run function cmd:player/armor/array/cycleto/foreach
scoreboard players set armor.cycleto.out var 0
execute if score cycleto.keep var matches 0 run scoreboard players set armor.cycleto.out var 1

execute store result score cycleto.i var if data storage cmd:storage/armor array[0].armor[]
execute if score armor.cycleto.type var matches 1.. if score cycleto.i var matches 1.. run function cmd:player/armor/array/cycleto/foreacharmor

#RESET
scoreboard players reset armor.cycleto.player var
scoreboard players reset armor.cycleto.type var
scoreboard players reset cycleto.i var
scoreboard players reset cycleto.keep var
data remove storage cmd:var find
