

#find players on team
execute store result score generate.team var run data get storage cmd:var generate.locations[0].team
execute as @a if score @s team = generate.team var run tag @s add generate-cell

#placer entity
summon marker 0 0 0 {Tags:["generate-placer"]}
data modify entity @e[type=marker,tag=generate-placer,limit=1] Pos set from storage cmd:var generate.locations[0].pos
execute as @e[type=marker,tag=generate-placer,limit=1] at @s if entity @a[tag=generate-cell] run function cmd:game/landmarks/playercells/generate/foreachplayer

kill @e[type=marker,tag=generate-placer]

#LOOP
data remove storage cmd:var generate.locations[0]
execute if data storage cmd:var generate.locations[] run function cmd:game/landmarks/playercells/generate/foreachteam
