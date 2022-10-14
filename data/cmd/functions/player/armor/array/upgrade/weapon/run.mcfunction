
#IN - A (armor.upgrade.weapon.stat -> var), C (armor.ugrade.weapon.passive -> var)| upgrade stat id, passive id
#OVERLOAD - A (armor.cycleto.player -> var) | playerid
#OUT - (armor.upgrade.out -> var) | armor level | AFFECTS [cmd:storage/armor -> array[0].array[0]]

#calls cycleto for overload
function cmd:player/armor/array/cycleto/run
