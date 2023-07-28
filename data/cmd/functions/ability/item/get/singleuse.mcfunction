
#parses multi use




#ENERGY AND COOLDOWN
#convert cooldowns
execute store result score ticks2sec.ticks var run data get storage cmd:var get.a.uses[0].cooldown
function cmd:process/text/ticks2sec/run
data modify storage cmd:var get.cooltext set from storage cmd:process/text/ticks2sec out
#parse
execute unless data storage cmd:var get.a.uses[0].maxWait run data modify block 0 0 0 front_text.messages[0] set value '[{"text":" "},{"nbt":"get.a.uses[0].energyCost","storage":"cmd:var","color":"yellow","bold":false,"italic":false},{"text":" | ","color":"gray","bold":false,"italic":false},{"nbt":"get.cooltext","storage":"cmd:var","interpret":true,"color":"gray","bold":false,"italic":false},{"text":"s","color":"gray","bold":false,"italic":false}]'
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 front_text.messages[0]
