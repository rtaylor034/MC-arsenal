
#USE - Call from a player to equip their associated boots (from armor array)
#NOTE - array MUST be parsed before calling this

clear @s leather_chestplate{customtags:{armor:1}}
scoreboard players operation armor.cycleto.player var = @s playerid
scoreboard players set armor.cycleto.type var 3
function cmd:player/armor/array/cycleto/run

item replace entity @s armor.chest with minecraft:leather_chestplate 1
item modify entity @s armor.chest cmd:armor/setarmornbt

#ATTRIBUTES
tag @s add attupdate
