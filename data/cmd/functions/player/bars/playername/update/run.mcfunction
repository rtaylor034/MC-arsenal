#IN - @s
#OUT - [update.bar -> cmd:var ; Json String] | updated namebar text

#USE - updates this players name bar

#NOTE - This is automatically called on player registration (bars/array/registerplayer), should not have to be called manually.


#FIND TRACKER
function cmd:player/tracker/find/run

#name reference
data modify storage cmd:var update.name set from entity @e[type=marker,tag=track,limit=1] data.playerName

#Team 1
execute if score @s team matches 1 run data modify block 0 0 0 front_text.messages[0] set value '{"nbt":"update.name","storage":"cmd:var","color":"#0000FF","bold":"true"}'

#Team 2
execute if score @s team matches 2 run data modify block 0 0 0 front_text.messages[0] set value '{"nbt":"update.name","storage":"cmd:var","color":"#FF0000","bold":"true"}'

#store
data modify storage cmd:var update.bar set from block 0 0 0 front_text.messages[0]

#PUT IN MAIN ARRAY
scoreboard players operation bars.cycleto.player var = @s playerid
function cmd:player/bars/array/cycleto/run
data modify storage cmd:storage/bars array[0].playerName set from storage cmd:var update.bar


#RESETS
function cmd:player/tracker/unfind/run
data remove storage cmd:var update.name
