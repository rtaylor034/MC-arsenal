
#CHILD FUNCTION OF player/bars/update


#name set
data modify entity @s CustomName set from storage cmd:var barupdate.bars[0]
data remove storage cmd:var barupdate.bars[0]

#loop
tag @s remove barupdate-name
scoreboard players remove barupdate.standcount var 1
execute as @e[type=minecraft:armor_stand,tag=barupdate-name] at @s if score @s barstack = barupdate.standcount var run function cmd:player/bars/subupdate/barname
