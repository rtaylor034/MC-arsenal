
#IN - (@s -> playerid)
#OUT N/A | AFFECTS [cmd:storage/armor -> array.armor]
#USE - call on a player to create an element in the armor array for them. must call on all players before starting game.

#NOTE - If this player already exists in the armor array, their data will be removed and replaced with fresh default unparsed data

#remove if already exists
scoreboard players operation armor.cycleto.player var = @s playerid
function cmd:player/armor/array/cycleto/run
execute if score armor.cycleto.out var matches 1 run data remove storage cmd:storage/armor array[0]


#initial add
data modify storage cmd:storage/armor array prepend from storage cmd:templates/armor registerplayer

#for each armor peice (runs 4 times)
scoreboard players set registerplayer.i var 0
function cmd:player/armor/array/registerplayer/addarmor

data modify storage cmd:storage/armor array[0].weapon set from storage cmd:templates/armor weapon

execute store result storage cmd:storage/armor array[0].playerid int 1 run scoreboard players get @s playerid
