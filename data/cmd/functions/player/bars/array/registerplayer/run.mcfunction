
#IN - (@s -> playerid)
#OUT N/A | AFFECTS [cmd:storage/bars -> array]
#USE - call on a player to create an element in the bars array for them. must call on all players before starting game.

#NOTE - If this player already exists in the bars array, their data will be removed and replaced with fresh default unparsed data

#remove if already exists
scoreboard players operation bars.cycleto.player var = @s playerid
function cmd:player/bars/array/cycleto/run
execute if score bars.cycleto.out var matches 1 run data remove storage cmd:storage/bars array[0]


#initial add
data modify storage cmd:storage/bars array prepend value {playerid:0,health:"",playerName:""}

#playerid
execute store result storage cmd:storage/bars array[0].playerid int 1 run scoreboard players get @s playerid

#PLAYER NAME BAR UPDATE
function cmd:player/bars/playername/update/run
