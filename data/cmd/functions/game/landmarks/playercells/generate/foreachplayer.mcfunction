

#target player
tag @a[tag=generate-cell,limit=1] add generate-target


#create cell mark
execute align xyz run summon marker ~.5 ~ ~.5 {Tags:["landmark","playercell","init"]}
scoreboard players operation @e[type=marker,tag=init,limit=1] playerid = @p[tag=generate-target] playerid
scoreboard players operation @e[type=marker,tag=init,limit=1] team = @p[tag=generate-target] team
tag @e[type=marker] remove init

#create boxmenu mark
execute align xyz positioned ~ ~1 ~2 run summon marker ~.5 ~ ~.5 {Tags:["landmark","boxmenu","init","playerbox"]}
scoreboard players operation @e[type=marker,tag=init,limit=1] playerid = @p[tag=generate-target] playerid
scoreboard players operation @e[type=marker,tag=init,limit=1] team = @p[tag=generate-target] team
tag @e[type=marker] remove init

#place structure
setblock ~ ~ ~ minecraft:structure_block[mode=load]{name:"cmd:playercell",posX:-2,posY:-1,posZ:-2,sizeX:5,sizeY:5,sizeZ:5,mode:"LOAD",powered:0b}
setblock ~ ~1 ~ redstone_block
setblock ~ ~ ~ air

#loop
tag @a[tag=generate-target] remove generate-cell
tag @a remove generate-target
execute if entity @a[tag=generate-cell] positioned ~4 ~ ~ run function cmd:game/landmarks/playercells/generate/foreachplayer
