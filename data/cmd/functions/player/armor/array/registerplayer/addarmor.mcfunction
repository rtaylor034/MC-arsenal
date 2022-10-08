
#called from run
scoreboard players add registerplayer.i var 1

data modify storage cmd:storage/armor array[0].armor prepend from storage cmd:templates/armor armorpeice
execute store result storage cmd:storage/armor array[0].armor[0].type int 1 run scoreboard players get registerplayer.i var

execute if score registerplayer.i var matches 1..3 run function cmd:player/armor/array/registerplayer/addarmor
