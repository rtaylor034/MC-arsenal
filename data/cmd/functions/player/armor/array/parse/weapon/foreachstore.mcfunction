
#called from weapon/parse

#DECRIMENT
scoreboard players remove parse.z var 1


#COUNT
execute store result score parse.stat.count var run data get storage cmd:var statstore[0].count

#STAT MULTIPLIER
#find in multiplier template array
data modify storage cmd:process/array/cycleto array set from storage cmd:templates/armor/controls statsPerUpgrade.weapon
data modify storage cmd:process/array/cycleto tag.id set from storage cmd:var statstore[0].id
function cmd:process/array/cycleto/run

#set multiplier
execute store result score parse.stat.mult var run data get storage cmd:process/array/cycleto out[0].value
scoreboard players operation parse.stat.count var *= parse.stat.mult var

#add base
execute store result score parse.stat.base var run data get storage cmd:process/array/cycleto out[0].base


#PARSE
execute if score parse.stat.count var matches 1.. run data modify block 0 0 0 front_text.messages[1] set value '[{"text":" "}, {"score":{"name":"parse.stat.base","objective":"var"},"color":"dark_gray","bold":false,"italic":false},{"text":" + ","color":"gray","bold":false,"italic":false},{"score":{"name":"parse.stat.count","objective":"var"},"color":"gray","bold":false,"italic":false},{"text":" "},{"nbt":"statstore[0].name","storage":"cmd:var","color":"gray","bold":false,"italic":false}]'
execute unless score parse.stat.count var matches 1.. run data modify block 0 0 0 front_text.messages[1] set value '[{"text":" "},{"score":{"name":"parse.stat.base","objective":"var"},"color":"dark_gray","bold":false,"italic":false},{"text":" "},{"nbt":"statstore[0].name","storage":"cmd:var","color":"dark_gray","bold":false,"italic":false}]'
data modify storage cmd:var w.itemtag.display.Lore append from block 0 0 0 front_text.messages[1]
#CYCLE
data modify storage cmd:var statstore append from storage cmd:var statstore[0]
data remove storage cmd:var statstore[0]
#LOOP
execute if score parse.z var matches 1.. run function cmd:player/armor/array/parse/weapon/foreachstore
