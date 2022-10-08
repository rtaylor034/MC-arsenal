
#IN - A (@s -> health), B (update.change -> var) | health, change in health (damage taken)
#OUT - [update.bar -> cmd:var ; Json String] | updated healthbar text

#USE - updates this players healthbar.

#NOTE - This usually will not have to be manually called, as it is called automatically whenever this player takes damage or heals through conventional means.
#NOTE - [B] is how much extra blank bar should be added after the health bar, indicating that damage has just been taken.

#get segments/remainder
scoreboard players operation update.health var = @s health
scoreboard players operation update.maxhealth var = @s max_health
scoreboard players operation update.shield var = @s shield

execute store result score update.div var run data get storage cmd:controls/display statPerIcon.health
execute store result score update.sdiv var run data get storage cmd:controls/display statPerIcon.shield
scoreboard players operation update.div var *= 2 const
scoreboard players operation update.sdiv var *= 2 const


scoreboard players operation update.remainder var = update.health var
scoreboard players operation update.chremainder var = update.change var
scoreboard players operation update.shremainder var = update.shield var

scoreboard players operation update.health var /= update.div var
scoreboard players operation update.maxhealth var /= update.div var
scoreboard players operation update.change var /= update.div var
scoreboard players operation update.shield var /= update.div var

scoreboard players operation update.remainder var %= update.div var
scoreboard players operation update.chremainder var %= update.div var
scoreboard players operation update.shremainder var %= update.div var

scoreboard players operation update.maxhealth var -= update.health var
scoreboard players operation update.maxhealth var -= update.change var
scoreboard players operation update.maxhealth var -= update.shield var

#health bar
execute if score update.health var matches 1.. run function cmd:player/bars/health/update/foreachhealth

#remainder
#(disabled for now)
#data modify storage cmd:var update.remainderbar set value ""
#execute if score update.remainder var matches 1.. run data modify storage cmd:var update.remainderbar set value "|"

#change bar
execute if score update.change var matches 1.. run function cmd:player/bars/health/update/foreachchange

#change remainder
data modify storage cmd:var update.chremainderbar set value ""
execute if score update.chremainder var matches 1.. run data modify storage cmd:var update.chremainderbar set value "|"

#max health
execute if score update.maxhealth var matches 1.. run function cmd:player/bars/health/update/formaxhealth
execute if score update.chremainder var matches 1.. run data remove storage cmd:var update.maxhealthbar[0]

#shield marker
data modify storage cmd:var update.shieldmark set value ""
execute if score update.shield var matches 1.. run data modify storage cmd:var update.shieldmark set value "|"
scoreboard players remove update.shield var 1

#shield
execute if score update.shield var matches 1.. run function cmd:player/bars/health/update/foreachshield


#PARSE

#Team 1
execute if score @s team matches 1 run data merge block 0 0 0 {Text1:'[{"nbt":"update.healthbar","storage":"cmd:var","interpret":true,"color":"#117AFF","bold":false,"italic":true,"underlined":false},{"nbt":"update.remainderbar","storage":"cmd:var","interpret":false,"color":"#117711","bold":false,"italic":true},{"text":"|","color":"yellow","bold":true,"italic":true,"underlined":false},{"nbt":"update.changebar","storage":"cmd:var","interpret":true,"color":"#AA3355","bold":false,"italic":true,"underlined":false},{"nbt":"update.chremainderbar","storage":"cmd:var","interpret":false,"color":"#443355","bold":false,"italic":true,"underlined":false},{"nbt":"update.shieldbar","storage":"cmd:var","interpret":true,"color":"aqua","bold":false,"italic":true,"underlined":false},{"nbt":"update.shieldmark","storage":"cmd:var","interpret":false,"color":"white","bold":true,"italic":true,"underlined":false},{"nbt":"update.maxhealthbar","storage":"cmd:var","interpret":true,"color":"black","bold":false,"italic":true,"underlined":false}]'}

#Team 2
execute if score @s team matches 2 run data merge block 0 0 0 {Text1:'[{"nbt":"update.healthbar","storage":"cmd:var","interpret":true,"color":"#FF7A11","bold":false,"italic":true,"underlined":false},{"nbt":"update.remainderbar","storage":"cmd:var","interpret":false,"color":"#117711","bold":false,"italic":true},{"text":"|","color":"yellow","bold":true,"italic":true,"underlined":false},{"nbt":"update.changebar","storage":"cmd:var","interpret":true,"color":"#CC3333","bold":false,"italic":true,"underlined":false},{"nbt":"update.chremainderbar","storage":"cmd:var","interpret":false,"color":"#773333","bold":false,"italic":true,"underlined":false},{"nbt":"update.shieldbar","storage":"cmd:var","interpret":true,"color":"aqua","bold":false,"italic":true,"underlined":false},{"nbt":"update.shieldmark","storage":"cmd:var","interpret":false,"color":"white","bold":true,"italic":true,"underlined":false},{"nbt":"update.maxhealthbar","storage":"cmd:var","interpret":true,"color":"black","bold":false,"italic":true,"underlined":false}]'}

#store
data modify storage cmd:var update.bar set from block 0 0 0 Text1

#debug
#tellraw @a [{"nbt":"update.healthbar","storage":"cmd:var","interpret":true,"color":"dark_green","bold":false,"italic":true},{"nbt":"update.remainderbar","storage":"cmd:var","interpret":false,"color":"#117711","bold":false,"italic":true},{"text":"|","color":"yellow","bold":true,"italic":true},{"nbt":"update.changebar","storage":"cmd:var","interpret":true,"color":"#CC3333","bold":false,"italic":true},{"nbt":"update.chremainderbar","storage":"cmd:var","interpret":false,"color":"#773333","bold":false,"italic":true},{"nbt":"update.maxhealthbar","storage":"cmd:var","interpret":true,"color":"black","bold":false,"italic":true},{"nbt":"update.shieldbar","storage":"cmd:var","interpret":true,"color":"#CFDFFF","bold":true,"italic":true},{"nbt":"update.shremainderbar","storage":"cmd:var","interpret":false,"color":"#99AABB","bold":true,"italic":true}]]

#PUT IN MAIN ARRAY
scoreboard players operation bars.cycleto.player var = @s playerid
function cmd:player/bars/array/cycleto/run
data modify storage cmd:storage/bars array[0].health set from storage cmd:var update.bar

#TAG and timer
execute store result score @s bar_health_timer run data get storage cmd:controls/display bars.health.autoupdate
tag @s add barupdate

#RESETS
scoreboard players reset update.health var
scoreboard players reset update.remainder var
scoreboard players reset update.div var
scoreboard players reset update.change var
scoreboard players reset update.maxhealth var
data remove storage cmd:var update.healthbar
data remove storage cmd:var update.remainderbar
data remove storage cmd:var update.changebar
data remove storage cmd:var update.maxhealthbar
data remove storage cmd:var update.chremainderbar
data remove storage cmd:var update.shieldbar
data remove storage cmd:var update.shieldmark
