
#USE - sets the "attackspeed" attribute storage nbt to reflect this players movement speed stat

execute store result score

#multiply
scoreboard players operation percent var = @s stat_mspeed
execute store result score mult var run data get storage cmd:controls/stats moveSpeed.multiplier
scoreboard players operation percent var *= mult var

#base movement speed buff (percent/10)
execute store result score base var run data get storage cmd:controls/stats moveSpeed.base
scoreboard players set mult var 10
scoreboard players operation base var *= mult var
scoreboard players operation percent var += base var

#store
execute store result storage cmd:var amount float 0.001 run scoreboard players get percent var

#add to attribute array
data modify storage cmd:var attributes prepend value {AttributeName:"generic.movement_speed",Name:"generic.movement_speed",Amount:0,Operation:1,UUID:[I;1347039443,325731338,-1521057341,-2060927894]}

#modify value
data modify storage cmd:var attributes[0].Amount set from storage cmd:var amount

#RESETS
data remove storage cmd:var amount
scoreboard players reset percent var
scoreboard players reset mult var
scoreboard players reset base var
