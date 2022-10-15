
#DESC - designated for all controls regarding weapons
#IMPORTANT NOTE - make sure to not have any duplicate "type" or "id" keys in any array.

#armor stat id key:
#1 = Power
#2 = Protection
#3 = Vitality/Health (UNUSED)
#4 = Movement Speed
#5 = Focus
#6 = Strength

#BASE WEAPON IDENTITIES
#"type" is the weapon type identifier.
#"name" is the name of the weapon.
#"innatestat" is the stat that is given when that type of weapon is chosen.
#"ranged" indicates whether or not the weapon is ranged or not (0 for melee, 1 for ranged).
#"abilityid" is the ability id that will be equipped to ability slot 4 when the type of weapon is chosen.
data modify storage cmd:controls/weapons baseIdentities set value []
data modify storage cmd:controls/weapons baseIdentities append value {type:1, name:"Direct", innatestat:1, abilityid:1001, ranged:0}
data modify storage cmd:controls/weapons baseIdentities append value {type:2, name:"Launcher", innatestat:1, abilityid:1501, ranged:1}

#INNATE STAT VALUE
#the value of the innate stat given when weapon is chosen.
data modify storage cmd:controls/weapons innateStatValue set value 15

#PASSIVES
data modify storage cmd:controls.weapons passives set value []
data modify storage cmd:controls.weapons passives append value {id:1, type:1, name:"Direct Passive 1"}
data modify storage cmd:controls.weapons passives append value {id:2, type:2, name:"Launcher Passive 1"}
