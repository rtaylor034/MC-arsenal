
#IN - A (armor.upgrade.in -> var), B (armor.upgrade.passive -> var)| upgrade stat id, passive id
#OVERLOAD - A (armor.cycleto.player -> var), B (armor.cycleto.type) | playerid, armor type
#OUT - (armor.upgrade.out -> var) | armor level | AFFECTS [cmd:storage/armor -> array[0].armor[0]]

#USE - adds (IN A) to the "stats[]" array on array[0].armor[0]. Additionally sets the "passiveid" to (IN B) if specified. Also increases the "level" value and returns it as OUT.

#NOTE - All (IN) values are optional, and this process will only upgrade what is specified. Do not set (IN) values that you do not wish to change on the weapon/armor.
#NOTE - this affects array[0] in the armor array, so set the armor.cycleto params first.
#NOTE - this process calls armor/array/cycleto, saving you a function call :)

#UPGRADE IDS (ARMOR)
#1 - Power
#2 - Protection
#3 - Health
#4 - Movement Speed
#5 - Focus
#6 - Strength

#UPGRADE IDS (WEAPON)
#1 - Damage
#2 - Attack Speed
#3 - Energy

#calls cycleto for overload
function cmd:player/armor/array/cycleto/run

#upgrade
execute if score armor.upgrade.in var matches 0.. run function cmd:player/armor/array/upgrade/armor
#passive
execute if score armor.upgrade.passive var matches 0.. store result storage cmd:storage/armor array[0].armor[0].passiveid int 1 run scoreboard players get armor.upgrade.passive var

#OUT
scoreboard players operation armor.upgrade.out var = upgrade.lvl var

#RESETS
scoreboard players reset upgrade.lvl var
data remove storage cmd:var upgrade
scoreboard players reset armor.upgrade.in var
scoreboard players reset armor.upgrade.passive var
