
#USE - Call from a player to equip their associated weapon (from armor array)
#NOTE - array MUST be parsed before calling this

#clear @s minecraft:carrot_on_a_stick{customtags:{weapon:1}}
scoreboard players operation armor.cycleto.player var = @s playerid
function cmd:player/armor/array/cycleto/run

item replace entity @s hotbar.0 with minecraft:carrot_on_a_stick 1
item modify entity @s hotbar.0 cmd:armor/setweaponnbt
