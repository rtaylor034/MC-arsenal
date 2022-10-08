
#USE - Call from a player to equip their associated boots (from armor array)
#NOTE - array MUST be parsed before calling this

clear @s leather_helmet{customtags:{armor:1}}
scoreboard players operation armor.cycleto.player var = @s playerid
scoreboard players set armor.cycleto.type var 4
function cmd:player/armor/array/cycleto/run

item replace entity @s armor.head with minecraft:leather_helmet 1
item modify entity @s armor.head cmd:armor/setarmornbt
