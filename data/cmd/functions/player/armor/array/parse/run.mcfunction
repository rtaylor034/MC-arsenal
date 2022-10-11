
#IN OPT - a (armor.parse.player -> var), b (armor.parse.type -> var), c (armor.parse.weapon -> var)| player to parse, armor peice
#OUT - N/A | AFFECTS [cmd:storage/armor -> array]
#USE - Converts ALL players' armor data into an actual item tag nbt and puts it in each armor peices respective "itemtag" nbt. if [a] or [b] is specified, this will only parse a specific player and/or armor peice. if [c] is specified, this will only parse weapons.


#count players
execute store result score parse.i var if data storage cmd:storage/armor array[]

#cycle to player
execute if score armor.parse.player var matches 1.. run scoreboard players operation armor.cycleto.player var = armor.parse.player var
execute if score armor.parse.player var matches 1.. run function cmd:player/armor/array/cycleto/run
execute if score armor.parse.player var matches 1.. run scoreboard players set parse.i var 1

#player forloop
data modify storage cmd:var array set from storage cmd:storage/armor array
execute if score parse.i var matches 1.. run function cmd:player/armor/array/parse/foreachplayer

#set
data modify storage cmd:storage/armor array set from storage cmd:var array

#RESETS
scoreboard players reset armor.parse.player var
scoreboard players reset armor.parse.type var
scoreboard players reset armor.parse.weapon var
scoreboard players reset parse.i var
scoreboard players reset parse.j var
scoreboard players reset parse.f var
scoreboard players reset parse.z var
scoreboard players reset parse.passive var
data remove storage cmd:var statstore
data remove storage cmd:var a
data remove storage cmd:var w
scoreboard players reset parse.stat.count var
scoreboard players reset parse.stat.mult var
scoreboard players reset parse.color var
scoreboard players reset parse.coloradd var
scoreboard players reset parse.desc var
scoreboard players reset parse.lvl var
data remove storage cmd:var nametext
data remove storage cmd:var passive
data remove storage cmd:var lvltext
data remove storage cmd:var array
data remove storage cmd:var active
