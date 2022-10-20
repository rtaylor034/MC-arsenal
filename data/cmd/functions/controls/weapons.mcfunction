
#DESC - designated for all controls regarding weapons
#IMPORTANT NOTE - make sure to not have any duplicate "type" or "id" keys in any array.

#armor stat id key:
#1 = Power
#2 = Protection
#3 = Vitality/Health (UNUSED)
#4 = Movement Speed
#5 = Focus
#6 = Strength

#weapon stat id key (melee / ranged):
#1 = Damage         1 = Damage
#2 = Attack delay   2 = Fire rate
#3 = Attack Windup  3 = Reload Speed
#4 = Range          4 = Ammo
#/ALL things related to Damage, Attack Windup, and Range are handled within the actual ability usage function.

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

#PATH STAT RATIO
#This defines how much each path upgrade actually affects the performance of the weapon.
#"id" is the path upgrade id (identifier).
#"percent[0]" is the percent multiplier of the respective melee path stat.
#"percent[1]" is the percent multiplier of the respective ranged path stat.
#Ex: {id:3, percent:[65, 115]} - When a melee weapon gets path upgraded with an id of 3 (Attack Windup), their attack windup will be 65% of its original value. For ranged (Ammo), their ammo will be 115% of its original value. This should stack multiplicatively NOT additively (65% * 65% = 42% | 115% * 115% = 132%)
data modify storage cmd:controls/weapons pathRatios set value [{id:1, percent:[110, 110]}, {id:2, percent:[75, 80]}, {id:3, percent:[65, 80]}, {id:4, percent:[120, 115]}]

#AUGMENTS ARRAY
#This is the main augment array (like passive array).
#"id" is the augment id (identifier).
#"type" is the type of weapon that the augment is compatible with.
#"statMods" is how this augment affects the weapon stats of this weapon when applied to it, similar to pathRatios.
data modify storage cmd:controls/weapons augments set value []
data modify storage cmd:controls/weapons augments append value {id:1, type:1, name:"Direct Passive 1", statMods:[{id:1, percent:100},{id:2, percent:80},{id:3, percent:50},{id:4, percent:110}]}
data modify storage cmd:controls/weapons augments append value {id:2, type:2, name:"Launcher Passive 1", statMods:[{id:1, percent:200},{id:2, percent:50},{id:3, percent:250},{id:4, percent:40}]}

#WEAPON ABILITY ARRAY
#These are added to the main ability array, and follow the same rules, with the exception of "weapon"
#These are handled by cmd:player/abilities/equip to generate the uses[] array.
#NOTE - make sure to offset the ability id by 1000 for melee and 1500 for ranged.
#"weapon.path" is left blank, this is for dynamic stat calculation.
#"weapon.augments" is left blank, this is for dynamic stat calculation.
#"weapon.stats" holds the base stats of the weapon ability. these are dynamic and change when a player equips the weapon ability based on their path upgrades and augments.
#"weapon.stats[{id:1}]" is the base damage that this ability does in general (handled by the ability function).
#"weapon.stats[{id:2}]" [MELEE] is the delay (cooldown) in ticks that the player must wait before attacking again (used in uses[] array generation).
#"weapon.stats[{id:2}]" [RANGED] is the delay (waitTime) in ticks that the player must wait before using the next use in the generated uses[] array (used in uses[] array generation).
#"weapon.stats[{id:3}]" [MELEE] is the time in ticks that the player channels before actually attacking (handled by the ability function).
#"weapon.stats[{id:3}]" [RANGED] is the delay (cooldown) in ticks of the last element of the generated uses[] array, known as reload time (used in uses[] array generation).
#"weapon.stats[{id:4}]" [MELEE] is the general range in 1/10th blocks of the attack (handled by the ability function).
#"weapon.stats[{id:4}]" [RANGED] is how many elements will be in the generated uses[] array, acting as ammo (used in the uses[] array generation).
#/For dynamic range of melee weapons, create a function that raycasts toward all nearby players, calculating the distance (steps to get to them), and the angle between where the caster is looking and where the raycast is "facing". Use these values to determine if an attack hit a player or not. Each melee ability should have an "attack-angle", and if the angle between where the caster is facing and the ray is facing is too large, then the attack does not hit the player that the ray is targetting. SMART TARGETTING!!
data modify storage cmd:controls/abilities array append value {id:1001, type:5, devName:"weapon_direct", name:"Direct Attack", weapon:{path:[], augments:[], stats:[{id:1, value:50},{id:2, value:35},{id:3, value:10},{id:4, value:15}]}}
data modify storage cmd:controls/abilities array append value {id:1501, type:5, devName:"weapon_launcher", name:"Launcher", weapon:{ranged:1, path:[], augments:[], stats:[{id:1, value:100},{id:2, value:20},{id:3, value:50},{id:4, value:5}]}}
