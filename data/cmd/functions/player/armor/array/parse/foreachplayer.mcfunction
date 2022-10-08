
#called from run

#DECRIMENT
scoreboard players remove parse.i var 1

#armor forloop (parsing)
execute store result score parse.j var if data storage cmd:storage/armor array[0].armor[]

execute if score armor.parse.type var matches 1.. run scoreboard players operation armor.cycleto.type var = armor.parse.type var
execute if score armor.parse.type var matches 1.. run function cmd:player/armor/array/cycleto/run
execute if score armor.parse.type var matches 1.. run scoreboard players set parse.j var 1



execute unless score armor.parse.weapon var matches 1.. if score parse.j var matches 1.. run function cmd:player/armor/array/parse/foreacharmor

#weapon branch
execute unless score armor.parse.type var matches 1.. run function cmd:player/armor/array/parse/weapon/parse

#CYCLE
data modify storage cmd:var array append from storage cmd:var array[0]
data remove storage cmd:var array[0]
#LOOP
execute if score parse.i var matches 1.. run function cmd:player/armor/array/parse/foreachplayer
