
#called from foreachplayer

#reference var "w"
data modify storage cmd:var w set from storage cmd:var array[0].weapon


#BASE TEMPLATE
data modify storage cmd:var w.itemtag set from storage cmd:templates/armor/parse weapon.itemtag


#WEAPON ACTIVE [DEPRICATED]
#execute store result score parse.active var run data get storage cmd:var w.activeid 1
#data modify storage cmd:process/array/cycleto array set from storage cmd:templates/armor/parse weapon.actives
#data modify storage cmd:process/array/cycleto tag.id set from storage cmd:var w.activeid
#function cmd:process/array/cycleto/run
#data modify storage cmd:var active set from storage cmd:process/array/cycleto out[0]

#NAME
#cycleto in name array
data modify storage cmd:process/array/cycleto array set from storage cmd:templates/armor/parse weapon.passives
data modify storage cmd:process/array/cycleto tag.id set from storage cmd:var w.passiveid
function cmd:process/array/cycleto/run
execute unless score cycleto.out var matches 1 run data modify storage cmd:process/array/cycleto out[0].name set from storage cmd:controls/armor weapon.defaultName

#lvl text array
data modify storage cmd:var lvltext set value []
execute store result score parse.lvl var run data get storage cmd:var w.level
execute if score parse.lvl var matches 1.. run function cmd:player/armor/array/parse/foreachlvl

#sign parse
data modify block 0 0 0 front_text.messages[0] set value '[{"nbt":"out[0].name","storage":"cmd:process/array/cycleto","interpret":false,"color":"gold","bold":false,"italic":false},{"text":" ","color":"aqua","bold":true,"italic":false},{"nbt":"lvltext","storage":"cmd:var","interpret":true,"color":"aqua","bold":true,"italic":false}]'
#execute if score parse.active var matches 1.. run data modify block 0 0 0 front_text.messages[0] set value '{"nbt":"active.name","storage":"cmd:var","color":"light_purple","bold":false,"italic":false,"underlined":false}'
data modify storage cmd:var w.itemtag.display.Name set from block 0 0 0 front_text.messages[0]


#STATS
#category text
execute store result score parse.lvl var run data get storage cmd:var w.level
data modify storage cmd:var w.itemtag.display.Lore append value '{"text":"Stats:","color":"white","italic":false}'


#count stats and apply color
execute store result score parse.f var if data storage cmd:var w.stats[]
data modify storage cmd:var statstore set from storage cmd:templates/armor/parse weapon.stats
execute if score parse.f var matches 1.. run function cmd:player/armor/array/parse/weapon/foreachstat

#cycle statstore to id:1 for consistent order in parsing
data modify storage cmd:process/array/cycleto array set from storage cmd:var statstore
data modify storage cmd:process/array/cycleto tag.id set value 1
function cmd:process/array/cycleto/run
data modify storage cmd:var statstore set from storage cmd:process/array/cycleto out

#parse stats
execute store result score parse.z var if data storage cmd:var statstore[]
execute if score parse.z var matches 1.. run function cmd:player/armor/array/parse/weapon/foreachstore


#ENCHANTMENT
execute if score parse.active var matches 1.. run data modify storage cmd:var w.itemtag.Enchantments set value [{lvl:1s, id:"minecraft:binding_curse"}]


#CUSTOM TAGS
#type
data modify storage cmd:var w.itemtag.customtags.type set from storage cmd:var w.type

#sets ref variable back
data modify storage cmd:var array[0].weapon set from storage cmd:var w
