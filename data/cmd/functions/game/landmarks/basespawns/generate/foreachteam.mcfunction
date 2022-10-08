

#find players on team
execute store result score generate.team var run data get storage cmd:var generate.locations[0].team
execute as @a if score @s team = generate.team var run tag @s add generate-spawn

#STARTPOS CALC
#EXP: <This Pos> - (<Offset>*(<Player count>-1))/2
#position
execute store result score generate.startpos.sx var run data get storage cmd:var generate.locations[0].pos[0] 1000
execute store result score generate.startpos.sy var run data get storage cmd:var generate.locations[0].pos[1] 1000
execute store result score generate.startpos.sz var run data get storage cmd:var generate.locations[0].pos[2] 1000
#center correction
scoreboard players add generate.startpos.sx var 500
scoreboard players add generate.startpos.sy var 500
scoreboard players add generate.startpos.sz var 500


#offset
execute store result score generate.startpos.x var run data get storage cmd:var generate.offset[0] 1000
execute store result score generate.startpos.y var run data get storage cmd:var generate.offset[1] 1000
execute store result score generate.startpos.z var run data get storage cmd:var generate.offset[2] 1000
#calc
execute store result score generate.startpos.mult var if entity @a[tag=generate-spawn]
scoreboard players remove generate.startpos.mult var 1
scoreboard players operation generate.startpos.x var *= generate.startpos.mult var
scoreboard players operation generate.startpos.y var *= generate.startpos.mult var
scoreboard players operation generate.startpos.z var *= generate.startpos.mult var
scoreboard players operation generate.startpos.x var /= 2 const
scoreboard players operation generate.startpos.y var /= 2 const
scoreboard players operation generate.startpos.z var /= 2 const
scoreboard players operation generate.startpos.sx var -= generate.startpos.x var
scoreboard players operation generate.startpos.sy var -= generate.startpos.y var
scoreboard players operation generate.startpos.sz var -= generate.startpos.z var
#store
data modify storage cmd:var generate.startpos set value [0d,0d,0d]
execute store result storage cmd:var generate.startpos[0] double 0.001 run scoreboard players get generate.startpos.sx var
execute store result storage cmd:var generate.startpos[1] double 0.001 run scoreboard players get generate.startpos.sy var
execute store result storage cmd:var generate.startpos[2] double 0.001 run scoreboard players get generate.startpos.sz var

#placer entity
summon marker 0 0 0 {Tags:["generate-placer"]}
data modify entity @e[type=marker,tag=generate-placer,limit=1] Pos set from storage cmd:var generate.startpos
execute as @e[type=marker,tag=generate-placer,limit=1] at @s if entity @a[tag=generate-spawn] run function cmd:game/landmarks/basespawns/generate/foreachplayer

kill @e[type=marker,tag=generate-placer]

#LOOP
data remove storage cmd:var generate.locations[0]
execute if data storage cmd:var generate.locations[] run function cmd:game/landmarks/basespawns/generate/foreachteam
