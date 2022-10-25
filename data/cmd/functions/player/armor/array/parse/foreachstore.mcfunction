
#called from foreacharmor

#DECRIMENT
scoreboard players remove parse.z var 1


#COUNT
execute store result score parse.stat.count var run data get storage cmd:var statstore[0].count

#ARMOR PEICE MULTIPLIER
#find in multiplier template array
data modify storage cmd:process/array/cycleto array set from storage cmd:templates/armor/controls statsPerUpgrade.armor
data modify storage cmd:process/array/cycleto tag.type set from storage cmd:var a.type
function cmd:process/array/cycleto/run
#set multiplier
execute store result score parse.stat.mult var run data get storage cmd:process/array/cycleto out[0].value
scoreboard players operation parse.stat.count var *= parse.stat.mult var

#PARSE
data merge block 0 0 0 {Text2:'[{"text":" +","color":"gray","bold":false,"italic":false},{"score":{"name":"parse.stat.count","objective":"var"},"color":"gray","bold":false,"italic":false},{"text":" "},{"nbt":"statstore[0].name","storage":"cmd:var","color":"gray","bold":false,"italic":false}]'}
execute if score parse.stat.count var matches 1.. run data modify storage cmd:var a.itemtag.display.Lore append from block 0 0 0 Text2
#CYCLE
data modify storage cmd:var statstore append from storage cmd:var statstore[0]
data remove storage cmd:var statstore[0]
#LOOP
execute if score parse.z var matches 1.. run function cmd:player/armor/array/parse/foreachstore
