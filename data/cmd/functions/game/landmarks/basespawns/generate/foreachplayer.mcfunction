

#target player
tag @a[tag=generate-spawn,limit=1] add generate-target


#create cell mark
summon marker ~ ~ ~ {Tags:["landmark","basespawn","init"]}
scoreboard players operation @e[type=marker,tag=init,limit=1] playerid = @p[tag=generate-target] playerid
scoreboard players operation @e[type=marker,tag=init,limit=1] team = @p[tag=generate-target] team
tag @e[type=marker] remove init

#update position offset
execute store result score generate.placerpos.x var run data get entity @s Pos[0] 1000
execute store result score generate.placerpos.y var run data get entity @s Pos[1] 1000
execute store result score generate.placerpos.z var run data get entity @s Pos[2] 1000
execute store result score generate.offset.x var run data get storage cmd:var generate.offset[0] 1000
execute store result score generate.offset.y var run data get storage cmd:var generate.offset[1] 1000
execute store result score generate.offset.z var run data get storage cmd:var generate.offset[2] 1000
scoreboard players operation generate.placerpos.x var += generate.offset.x var
scoreboard players operation generate.placerpos.y var += generate.offset.y var
scoreboard players operation generate.placerpos.z var += generate.offset.z var
data modify storage cmd:var generate.placerpos set value [0d,0d,0d]
execute store result storage cmd:var generate.placerpos[0] double 0.001 run scoreboard players get generate.placerpos.x var
execute store result storage cmd:var generate.placerpos[1] double 0.001 run scoreboard players get generate.placerpos.y var
execute store result storage cmd:var generate.placerpos[2] double 0.001 run scoreboard players get generate.placerpos.z var

#DEBUG
tellraw @a {"nbt":"Pos","entity":"@s"}


data modify entity @s Pos set from storage cmd:var generate.placerpos

#loop
tag @a[tag=generate-target] remove generate-spawn
tag @a remove generate-target
execute if entity @a[tag=generate-spawn] at @s run function cmd:game/landmarks/basespawns/generate/foreachplayer
