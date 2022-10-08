
#USE - Call from a player to equip their associated boots (from armor array)
#NOTE - array MUST be parsed before calling this

clear @s leather_leggings{customtags:{armor:1}}
scoreboard players operation armor.cycleto.player var = @s playerid
scoreboard players set armor.cycleto.type var 2
function cmd:player/armor/array/cycleto/run

item replace entity @s armor.legs with minecraft:leather_leggings 1
item modify entity @s armor.legs cmd:armor/setarmornbt
