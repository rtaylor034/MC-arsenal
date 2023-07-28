
#called from load
#declares all templates and nbt storage for armor
#Mainly to create references to controls, so that if a control changes its name or anything else, it just has to be changed here, instead of scouring code to find whenever they are used.
## DEVNOTE - this was controls before controls existed, only still exists becuase too lazy to change all paths.

#ARMOR TYPES
#1 - Boots
#2 - Leggings
#3 - Chestplate
#4 - Helmet

#UPGRADE IDS
#1 - Power
#2 - Protection
#3 - Health
#4 - Movement Speed
#5 - Focus
#6 - Strength


#REGISTERPLAYER
execute unless data storage cmd:storage/armor array run data modify storage cmd:storage/armor array set value []
data modify storage cmd:templates/armor registerplayer set value {playerid:0, armor:[], weapon:{}}
data modify storage cmd:templates/armor armorpeice set value {type:0,level:0, passiveid:0, stats:[], itemtag:{}}
data modify storage cmd:templates/armor weapon set value {type:0, level:0, path:[], augments:[], itemtag:{}}

#ARMOR PARSE
#default itemtag
data modify storage cmd:templates/armor/parse itemtag set value {display:{Name:"",Lore:[],color:8947848},customtags:{armor:1,type:0}}

#passives
data modify storage cmd:templates/armor/parse passives set from storage cmd:controls/armor passives

#base color
data modify storage cmd:templates/armor/parse basecolor set from storage cmd:controls/armor defaultColor


#name
data modify storage cmd:templates/armor/parse weapon.passives set from storage cmd:controls/armor weapon.passives


#WEAPON PARSE
#default itemtag
data modify storage cmd:templates/armor/parse weapon.itemtag set value {display:{Name:"",Lore:[]},customtags:{weapon:1,type:0}}

#stats
data modify storage cmd:templates/armor/parse weapon.stats set from storage cmd:controls/armor statIdentities.weapon

#name
data modify storage cmd:templates/armor/parse weapon.names set from storage cmd:controls/armor names.weaponTypes

#CONTROLS
data modify storage cmd:templates/armor/controls statsPerUpgrade set from storage cmd:controls/armor statsPerUpgrade
data modify storage cmd:templates/armor/parse stats set from storage cmd:controls/armor statIdentities.armor
