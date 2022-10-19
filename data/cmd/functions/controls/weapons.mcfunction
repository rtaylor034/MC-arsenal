
#DESC - designated for all controls regarding weapons
#IMPORTANT NOTE - make sure to not have any duplicate "type" or "id" keys in any array.

#armor stat id key:
#1 = Power
#2 = Protection
#3 = Vitality/Health (UNUSED)
#4 = Movement Speed
#5 = Focus
#6 = Strength

#path id key (melee / ranged):
#1 = Damage / Damage
#2 = Attack delay(speed) / Fire rate
#3 = Attack Windup / Ammo
#4 = Range / Reload speed
#/Damage, Attack Windup, and range are handled within the actual ability usage function.

#BASE WEAPON IDENTITIES
#"type" is the weapon type identifier.
#"name" is the name of the weapon.
#"innateastat" is the armor stat that is given when that type of weapon is chosen.
#"ranged" indicates whether or not the weapon is ranged or not (0 for melee, 1 for ranged).
#"abilityid" is the ability id that will be equipped to ability slot 4 when the type of weapon is chosen.
data modify storage cmd:controls/weapons baseIdentities set value []
data modify storage cmd:controls/weapons baseIdentities append value {type:1, name:"Direct", innatestat:1, abilityid:1001, ranged:0}
data modify storage cmd:controls/weapons baseIdentities append value {type:2, name:"Launcher", innatestat:1, abilityid:1501, ranged:1}

#INNATE STAT VALUE
#the value of the innate armor stat given when weapon is chosen.
data modify storage cmd:controls/weapons innateStatValue set value 15

#UPGRADE ORDER
#this defines what gets added to the weapon each upgrade, in order.
#a 0 is a path upgrade, and a 1 is an augment.
#the number of elements in this array is the max level a weapon can be upgraded.
#Ex: [0,1,0,0,1], at upgrade number 2 and 5, the weapon will recieve augments, at other upgrade levels it will get a path upgrade.
data modify storage cmd:controls/weapons upgradeOrder set value [0,0,1,0,1]

#AUGMENTS
data modify storage cmd:controls/weapons augments set value []
data modify storage cmd:controls/weapons augments append value {id:1, type:1, name:"Direct Passive 1"}
data modify storage cmd:controls/weapons augments append value {id:2, type:2, name:"Launcher Passive 1"}

#WEAPON ABILITY ARRAY
#These are added to the main ability array, and follow the same rules, with the exception of "weapon"
#These must be equipped with the "equip.weapon" arguement in cmd:player/abilities/equip to generate the uses[] array.
#"weapon.path" is left blank, this is for ability event call information.
#"weapon.augments" is left blank, this is for ability event call information.
#"weapon.use" is information given to the equip function to generate an actual uses[] array.
#"weapon.use.ranged" indicates whether or not the weapon is ranged or not.
#"weapon.use.cooldown" (NON-RANGED ONLY) is the attack delay (cooldown) of the ability.
#"weapon.use.reload" (RANGED ONLY) is how long in ticks the weapon takes to reload (final uses[] cooldown).
#"weapon.use.fireDelay" (RANGED ONLY) is the minimum delay between attack/fire in ticks (waitTime in uses[] array).
#"weapon.use.ammo" (RANGED ONLY) is the amount of duplicates that will be generates in the abilities uses[] array.
#NOTE - non-ranged weapons will only generate 1 element in the uses[] array, while ranged will generate however many elements to match their ammo amount.
data modify storage cmd:controls/abilities array append value {id:1001, type:4, devName:"weapon_direct", name:"Direct Attack", weapon:{path:[], augments:[], use:{ranged:0, cooldown:35}}}
data modify storage cmd:controls/abilities array append value {id:1501, type:4, devName:"weapon_launcher", name:"Launcher", weapon:{path:[], augments:[], use:{ranged:1, reload:50, ammo:5, fireDelay:20}}}
