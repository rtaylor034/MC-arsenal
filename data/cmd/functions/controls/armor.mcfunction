
#DESC - designated for all controls regarding armor/weapon and stats gained by armor/weapon
#IMPORTANT NOTE - make sure to not have any duplicate "type" or "id" keys in any array.

#armor type key:
#1 = boots
#2 = leggings
#3 = chestplate
#4 = helmet

#armor stat id key:
#1 = Power
#2 = Protection
#3 = Vitality/Health (UNUSED)
#4 = Movement Speed
#5 = Focus
#6 = Strength

#==== GAMEPLAY ====
#STATS PER UPGRADE
#"value" in the armor[] array is the amount of stats gained per upgrade on the armor peice specified with the matching "type".
#"value" in the weapon[] array is the amount of stats gained per upgrade when the stat specified in "id" is upgraded.
#"base" in the weapon[] array is the starting value of the stat specified in "id" when the weapon is level 0.
#"cost" is the cost in t to upgrade the specified peice of armor mwith the matching "type".
data modify storage cmd:controls/armor statsPerUpgrade set value {armor:[{type:1, value:5, cost:15}, {type:2, value:15, cost:40}, {type:3, value:20, cost:50},{type:4, value:10, cost: 25}], weapon:[{id:1, value:10, base:20}, {id:2, value:2, base:10}, {id:3, value:20, base:100}]}

#LEVEL CAPS
#"max" is the maximum level an armor peice/weapon can be upgraded too.
#"passive" is the upgrade level where the player selects their passive.
data modify storage cmd:controls/armor levels set value {armor:[{type:1,max:5,passive:4},{type:2,max:5,passive:4},{type:3,max:5,passive:4},{type:4,max:5,passive:4}], weapon:{max:6,passive:3}}

#==== PARSING ====

#BASE ARMOR COLOR
data modify storage cmd:controls/armor defaultColor set value {r:20, g:20, b:20}

#STAT IDENTITIES
#this refers to what happens when the stat specified in "id" is upgraded on an armor peice.
#"color" is is the RGB color value that is added to the base armor color per stat (can range from -255 to 255, but recommended to not go further than 60 for any value to prevent color value overflow)
#"name" is the name of the stat when displayed on armor or anything else.
data remove storage cmd:controls/armor statIdentities
data modify storage cmd:controls/armor statIdentities.armor set value [{id:1, name:"Power", color:{r:45, g:0, b:45}}, {id:2, name:"Protection", color:{r:7, g:12, b:45}}, {id:4, name:"Movement Speed", color:{r:45, g:45, b:15}}, {id:5, name:"Focus", color:{r:45, g:45, b:45}}, {id:6, name:"Max Energy", color:{r:45, g:0, b:0}}]
#Vitality is hidden and is not a valid armor-stat
#{id:3, name:"Vitality", color:{r:0, g:45, b:0}}

#NAMES
#controls what name the armor peice/weapon will have depending on the "type" specified.
#"name" is the display name that will be displayed on each armor peice item
#"item" is the corresponding minecraft item to the armor peice
data modify storage cmd:controls/armor names.armorTypes set value [{type:1, name:"Boots",item:"minecraft:leather_boots"}, {type:2, name:"Leggings",item:"minecraft:leather_leggings"}, {type:3, name:"Chestplate",item:"minecraft:leather_chestplate"},{type:4, name:"Helmet",item:"minecraft:leather_helmet"}]

#ARMOR PASSIVES
#controls the name of armor passives according to "id". Mainly for parsing
#"name" is the display name of the passive.
#"innatestat" is the id of the stat that is automatically upgraded when buying the passive.
#"desc" is a very breif description of what the passive does, each element is a new line. should be at MOST 4 lines, with around 5 words per line.(in depth descriptions should be elsewhere)
data modify storage cmd:controls/armor passives set value []
data modify storage cmd:controls/armor passives append value {id:1, name:"Zephyr's Blessing", innatestat:5, desc:["Gain movement speed after using", "a utility ability"]}
data modify storage cmd:controls/armor passives append value {id:2, name:"Test Passive Two", innatestat:1, desc:["test description two"]}
