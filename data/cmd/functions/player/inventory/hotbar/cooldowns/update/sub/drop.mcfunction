
#updates the drop slot (hotbar 5)

#NOTE - update.time stores the ability time
#NOTE - [a -> cmd:var] stores this abilities object
#DEVNOTE - CustomModelData support yet to be impemented


#ITEM SET
execute if score update.time var matches ..0 run item replace entity @s hotbar.5 with leather_helmet{CustomModelData:1,customtags:{hotbar:5,cooldownslot:1}}
execute if score update.time var matches 1.. run item replace entity @s hotbar.5 with gray_dye{CustomModelData:1,customtags:{hotbar:5,cooldownslot:1}}


#keybind text set
data merge block 0 0 0 {Text1:'{"keybind":"key.drop"}'}
data modify storage cmd:var update.keybind set from block 0 0 0 Text1

#parse
function cmd:player/inventory/hotbar/cooldowns/update/sub/parse

#nbt merge
item modify entity @s hotbar.5 cmd:mergenbt
data remove storage cmd:var mergenbt

#COUNT SET
scoreboard players set 20 var 20
execute store result score setcount.in var run scoreboard players operation update.time var /= 20 var
scoreboard players add setcount.in var 1
item modify entity @s hotbar.5 cmd:setcount
scoreboard players reset setcount.in var
