#CALL - weaponparse


#MELEE HEADER
data merge block 0 0 0 {Text1:'[{"text":" ","color":"#DDDDDD","bold":false,"italic":false},{"text":"MELEE","color":"red","bold":false,"italic":false,"underlined":true}]'}
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 Text1
#data modify storage cmd:var get.item.tag.display.Lore append value '{"text":" "}'

#convert cooldowns
execute store result score ticks2sec.ticks var run data get storage cmd:var get.a.weapon.stats[{id:2}].value
function cmd:process/text/ticks2sec/run
data modify storage cmd:var get.delaytext set from storage cmd:process/text/ticks2sec out
execute store result score ticks2sec.ticks var run data get storage cmd:var get.a.weapon.stats[{id:3}].value
function cmd:process/text/ticks2sec/run
data modify storage cmd:var get.winduptext set from storage cmd:process/text/ticks2sec out

#DAMAGE
data merge block 0 0 0 {Text1:'[{"text":" Damage: ","color":"white","italic":false},{"nbt":"get.a.weapon.stats[{id:1}].value","storage":"cmd:var","color":"red","bold":true,"italic":false,"interpret":false},{"text":" HP","color":"red","bold":false,"italic":false}]'}
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 Text1

#ATTACK DELAY
data merge block 0 0 0 {Text1:'[{"text":" Cooldown: ","color":"white","italic":false},{"nbt":"get.delaytext","storage":"cmd:var","color":"gray","bold":true,"italic":false,"interpret":true},{"text":" sec.","color":"gray","bold":false,"italic":false}]'}
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 Text1

#WINDUP
data merge block 0 0 0 {Text1:'[{"text":" Windup: ","color":"white","italic":false},{"nbt":"get.winduptext","storage":"cmd:var","color":"dark_aqua","bold":true,"italic":false,"interpret":true},{"text":" sec.","color":"dark_aqua","bold":false,"italic":false}]'}
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 Text1

#range conversion to blocks
execute store result score ticks2sec.ticks var run data get storage cmd:var get.a.weapon.stats[{id:4}].value
scoreboard players operation ticks2sec.ticks var *= 2 const
function cmd:process/text/ticks2sec/run
data modify storage cmd:var get.rangetext set from storage cmd:process/text/ticks2sec out

#RANGE
data merge block 0 0 0 {Text1:'[{"text":" Range: ","color":"white","italic":false},{"nbt":"get.rangetext","storage":"cmd:var","color":"green","bold":true,"italic":false,"interpret":true},{"text":" blk.","color":"green","bold":false,"italic":false}]'}
data modify storage cmd:var get.item.tag.display.Lore append from block 0 0 0 Text1
