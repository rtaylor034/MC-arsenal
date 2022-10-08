

#convert IN to storage nbt
execute store result storage cmd:var upgrade int 1 run scoreboard players get armor.upgrade.in var

#append value
data modify storage cmd:storage/armor array[0].armor[0].stats append from storage cmd:var upgrade

#updates level
execute store result score upgrade.lvl var run data get storage cmd:storage/armor array[0].armor[0].level 1
scoreboard players add upgrade.lvl var 1
execute store result storage cmd:storage/armor array[0].armor[0].level int 1 run scoreboard players get upgrade.lvl var
