
#CALL - systems/bars/base





#TP
tp @s ~ ~ ~





tag @s remove bartp
scoreboard players add bars.stack var 1
execute as @e[type=minecraft:armor_stand,tag=bartp] if score @s barstack = bars.stack var positioned ~ ~.3 ~ run function cmd:player/systems/bars/barstack
