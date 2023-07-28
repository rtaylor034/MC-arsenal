
#called from foreachplayer

#reference var "a"
data modify storage cmd:var a set from storage cmd:var array[0].armor[0]

#DECRIMENT
scoreboard players remove parse.j var 1

#PARSE

#passive id store
execute store result score parse.passive var run data get storage cmd:var a.passiveid 1

#passive name/desc store
data modify storage cmd:process/array/cycleto array set from storage cmd:templates/armor/parse passives
data modify storage cmd:process/array/cycleto tag.id set from storage cmd:var a.passiveid
function cmd:process/array/cycleto/run
data modify storage cmd:var passive set from storage cmd:process/array/cycleto out[0]

#== BASE TEMPLATE ==
data modify storage cmd:var a.itemtag set from storage cmd:templates/armor/parse itemtag

#color
data modify storage cmd:process/math/rgbtodecimal in set from storage cmd:templates/armor/parse basecolor
function cmd:process/math/rgbtodecimal/run
execute store result storage cmd:var a.itemtag.display.color int 1 run scoreboard players get rgbtodecimal.out var

#== NAME ==
#cycleto in name array
data modify storage cmd:process/array/cycleto array set from storage cmd:templates/armor/parse names
data modify storage cmd:process/array/cycleto tag.type set from storage cmd:var a.type
function cmd:process/array/cycleto/run

#lvl text array
data modify storage cmd:var lvltext set value []
execute store result score parse.lvl var run data get storage cmd:var a.level
execute if score parse.lvl var matches 1.. run function cmd:player/armor/array/parse/foreachlvl

#sign parse
execute unless score parse.passive var matches 1.. run data modify block 0 0 0 front_text.messages[0] set value '[{"nbt":"out[0].name","storage":"cmd:process/array/cycleto","interpret":false,"color":"yellow","bold":false,"italic":false},{"text":" ","bold":true}, {"nbt":"lvltext","storage":"cmd:var","interpret":true,"color":"aqua","bold":true,"italic":false}]'
execute if score parse.passive var matches 1.. run data modify block 0 0 0 front_text.messages[0] set value '[{"nbt":"out[0].name","storage":"cmd:process/array/cycleto","color":"gold","bold":false,"italic":false,"underlined":false},{"text":" ","bold":true},{"nbt":"lvltext","storage":"cmd:var","interpret":true,"color":"aqua","bold":true,"italic":false}]'
data modify storage cmd:var a.itemtag.display.Name set from block 0 0 0 front_text.messages[0]




#== STATS ==
#category text
execute store result score parse.lvl var run data get storage cmd:var a.level
#execute if score parse.lvl var matches 1.. run data modify storage cmd:var a.itemtag.display.Lore append value '{"text":" Stats:","color":"white","italic":false}'



#count stats and apply color
execute store result score parse.f var if data storage cmd:var a.stats[]
data modify storage cmd:var statstore set from storage cmd:templates/armor/parse stats
execute if score parse.f var matches 1.. run function cmd:player/armor/array/parse/foreachstat

#cycle statstore to id:1 for consistent order in parsing
data modify storage cmd:process/array/cycleto array set from storage cmd:var statstore
data modify storage cmd:process/array/cycleto tag.id set value 1
function cmd:process/array/cycleto/run
data modify storage cmd:var statstore set from storage cmd:process/array/cycleto out


#parse stats
execute store result score parse.z var if data storage cmd:var statstore[]
execute if score parse.z var matches 1.. run function cmd:player/armor/array/parse/foreachstore

#== PASSIVE DESCRIPTION ==
#execute if score parse.passive var matches 1.. run data modify storage cmd:var a.itemtag.display.Lore append value '{"text":" "}'

data modify block 0 0 0 front_text.messages[0] set value '[{"text":" "}, {"text":"+","italic":false,"color":"dark_purple","bold":true}, {"nbt":"passive.name","storage":"cmd:var","color":"light_purple","bold":true,"italic":false,"underlined":false}, {"text":"","italic":false,"color":"aqua"}]'
execute if score parse.passive var matches 1.. run data modify storage cmd:var a.itemtag.display.Lore append from block 0 0 0 front_text.messages[0]

execute store result score parse.desc var if data storage cmd:var passive.desc[]
execute if score parse.passive var matches 1.. if score parse.desc var matches 1.. run function cmd:player/armor/array/parse/foreachdesc

#PASSIVE LORE
#category text
##execute if score parse.passive var matches 1.. run data modify storage cmd:var a.itemtag.display.Lore append value '{"text":" "}'
##execute if score parse.passive var matches 1.. run data modify storage cmd:var a.itemtag.display.Lore append value '{"text":"Passive:","color":"gold","italic":false}'

#sign parse
##data modify block 0 0 0 front_text.messages[0] set value '{"nbt":"passive.desc","storage":"cmd:var","color":"dark_gray","bold":false,"italic":false,"interpret":true}'
##execute if score parse.passive var matches 1.. run data modify storage cmd:var a.itemtag.display.Lore append from block 0 0 0 front_text.messages[0]


#ENCHANTMENT
execute if score parse.passive var matches 1.. run data modify storage cmd:var a.itemtag.Enchantments set value [{lvl:1s, id:"minecraft:binding_curse"}]

#CUSTOM TAGS
#type (for tracking if player has armor equipped)
data modify storage cmd:var a.itemtag.customtags.type set from storage cmd:var a.type


#sets ref variable back
data modify storage cmd:var array[0].armor[0] set from storage cmd:var a

#CYCLE
data modify storage cmd:var array[0].armor append from storage cmd:var array[0].armor[0]
data remove storage cmd:var array[0].armor[0]
#LOOP
execute if score parse.j var matches 1.. run function cmd:player/armor/array/parse/foreacharmor
