
#parses multi use



#USE HEADER
data merge block 0 0 0 {Text1:'[{"text":" Use ","color":"white","bold":false,"italic":false},{"score":{"name":"get.use","objective":"var"},"color":"white","bold":false,"italic":false},{"text":":","color":"white","bold":false,"italic":false}]'}
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 Text1

#ENERGY AND COOLDOWN
#convert cooldowns
execute store result score ticks2sec.ticks var run data get storage cmd:var get.a.uses[0].cooldown
function cmd:process/text/ticks2sec/run
data modify storage cmd:var get.cooltext set from storage cmd:process/text/ticks2sec out
execute store result score ticks2sec.ticks var run data get storage cmd:var get.a.uses[0].maxWait
function cmd:process/text/ticks2sec/run
data modify storage cmd:var get.waittext set from storage cmd:process/text/ticks2sec out
#if has waittime
execute if data storage cmd:var get.a.uses[0].maxWait run data merge block 0 0 0 {Text1:'[{"text":"  "},{"nbt":"get.a.uses[0].energyCost","storage":"cmd:var","color":"yellow","bold":false,"italic":false},{"text":" | ","color":"gray","bold":false,"italic":false},{"nbt":"get.cooltext","storage":"cmd:var","interpret":true,"color":"gray","bold":false,"italic":false},{"text":"s | ","color":"gray","bold":false,"italic":false},{"nbt":"get.waittext","storage":"cmd:var","interpret":true,"color":"red","bold":false,"italic":false},{"text":"s","color":"red","bold":false,"italic":false}]'}
#if not
execute unless data storage cmd:var get.a.uses[0].maxWait run data merge block 0 0 0 {Text1:'[{"text":"  "},{"nbt":"get.a.uses[0].energyCost","storage":"cmd:var","color":"yellow","bold":false,"italic":false},{"text":" | ","color":"gray","bold":false,"italic":false},{"nbt":"get.cooltext","storage":"cmd:var","interpret":true,"color":"gray","bold":false,"italic":false},{"text":"s","color":"gray","bold":false,"italic":false}]'}
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 Text1