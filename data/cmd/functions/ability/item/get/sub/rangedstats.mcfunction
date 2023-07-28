#CALL - weaponparse


#RANGED HEADER
data modify block 0 0 0 front_text.messages[0] set value '[{"text":" ","color":"#DDDDDD","bold":false,"italic":false},{"text":"RANGED","color":"yellow","bold":false,"italic":false,"underlined":true}]'
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 front_text.messages[0]
#data modify storage cmd:var get.item.tag.display.Lore append value '{"text":" "}'

#convert cooldowns
execute store result score ticks2sec.ticks var run data get storage cmd:var get.a.weapon.stats[{id:2}].value
function cmd:process/text/ticks2sec/run
data modify storage cmd:var get.delaytext set from storage cmd:process/text/ticks2sec out
execute store result score ticks2sec.ticks var run data get storage cmd:var get.a.weapon.stats[{id:3}].value
function cmd:process/text/ticks2sec/run
data modify storage cmd:var get.winduptext set from storage cmd:process/text/ticks2sec out

#DAMAGE
data modify block 0 0 0 front_text.messages[0] set value '[{"text":" Damage: ","color":"white","italic":false},{"nbt":"get.a.weapon.stats[{id:1}].value","storage":"cmd:var","color":"red","bold":true,"italic":false,"interpret":false},{"text":" HP","color":"red","bold":false,"italic":false}]'
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 front_text.messages[0]

#ATTACK DELAY
data modify block 0 0 0 front_text.messages[0] set value '[{"text":" Fire Delay: ","color":"white","italic":false},{"nbt":"get.delaytext","storage":"cmd:var","color":"gray","bold":true,"italic":false,"interpret":true},{"text":" sec.","color":"gray","bold":false,"italic":false}]'
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 front_text.messages[0]

#AMMO
data modify block 0 0 0 front_text.messages[0] set value '[{"text":" Ammo: ","color":"white","italic":false},{"nbt":"get.a.weapon.stats[{id:4}].value","storage":"cmd:var","color":"green","bold":true,"italic":false,"interpret":false},{"text":" ","color":"green","bold":false,"italic":false}]'
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 front_text.messages[0]

#WINDUP
data modify block 0 0 0 front_text.messages[0] set value '[{"text":" Reload: ","color":"white","italic":false},{"nbt":"get.winduptext","storage":"cmd:var","color":"dark_aqua","bold":true,"italic":false,"interpret":true},{"text":" sec.","color":"dark_aqua","bold":false,"italic":false}]'
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 front_text.messages[0]
