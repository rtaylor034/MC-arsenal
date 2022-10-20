

#find player
execute as @a if score @s playerid = get.playerid var run tag @s add get-found

#find tracker
execute as @a[tag=get-found,limit=1,sort=nearest] at @s run function cmd:player/tracker/find/run

#find ability
data modify storage cmd:process/array/cycleto array set from entity @e[type=marker,tag=track,limit=1,sort=nearest] data.abilities
execute store result storage cmd:process/array/cycleto tag.slot int 1 run scoreboard players get get.slot var
function cmd:process/array/cycleto/run

#id set
execute if score cycleto.out var matches 1 store result score get.id var run data get storage cmd:process/array/cycleto out[0].id

#ref set
data modify storage cmd:var get.a set from storage cmd:process/array/cycleto out[0]

#success
execute unless data storage cmd:process/array/cycleto out[0].id run scoreboard players set get.success var 0
