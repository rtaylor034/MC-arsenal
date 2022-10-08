
#IN - A (get.statid -> var) | stat id
#IN OPT - b (get.weapon -> var) | is weapon stat?
#OUT - A (get.modeldata -> var), B (get.color -> var) | icon CustomModelData, icon color value

#USE - Gets the CustomModelData and color for the icon of the stat specified by (IN). if (IN b) is 1, then it will be specify weapon stat

#NOTE - based off of [statIcon.offset -> cmd:controls/display], just adds the offset to stat id and returns it.
#NOTE - color is based off of 3x the color specified in [statIdentities -> cmd:controls/armor]
#NOTE - ability icon items are strictly "minecraft:leather_helmet", and this CustomModelData should be applied to that item.

# weapon stat id key:
#1 = damage
#2 = attack speed
#3 = max energy

#armor stat id key:
#1 = Power
#2 = Protection
#3 = Vitality/Health
#4 = Movement Speed
#5 = Focus
#6 = Strength

#WEAPON/ARMOR
execute unless score get.weapon var matches 1.. run function cmd:modeldata/staticon/get/armor
execute if score get.weapon var matches 1.. run function cmd:modeldata/staticon/get/weapon


#RESETS
scoreboard players reset get.abilityid var
scoreboard players reset get.offset var
scoreboard players reset get.weapon var
scoreboard players reset get.mult var
