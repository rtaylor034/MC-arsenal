
#IN - A (weapon.upgrade.path -> var) | upgrade path id
#IN ALT - Aa (weapon.upgrade.augment -> var) | upgrade augment id
#OVERLOAD - A (armor.cycleto.player -> var) | playerid
#OUT - (weapon.upgrade.out -> var) | weapon level | AFFECTS [cmd:storage/armor -> array[0].array[0]]

#DESC - Upgrades the player's weapon in [cmd:storage/armor array[0].array[0]], adding [IN A] to its path stats and [IN B] to its augments. Also increases the weapons level.

#calls cycleto for overload
function cmd:player/armor/array/cycleto/run

#/here or somewhere, make a method that applies the weapons path stats to its actual ability object in the player tracker
