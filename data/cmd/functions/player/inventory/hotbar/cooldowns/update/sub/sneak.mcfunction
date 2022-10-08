
#updates the sneak slot (hotbar 7)

#NOTE - update.time stores the ability time
#DEVNOTE - CustomModelData support yet to be impemented


#ITEM SET
execute if score update.time var matches ..0 run item replace entity @s hotbar.7 with leather_helmet{CustomModelData:1,customtags:{hotbar:7,cooldownslot:3}}
execute if score update.time var matches 1.. run item replace entity @s hotbar.7 with gray_dye{CustomModelData:1,customtags:{hotbar:7,cooldownslot:3}}

#keybind text set
data merge block 0 0 0 {Text1:'{"keybind":"key.sneak"}'}
data modify storage cmd:var update.keybind set from block 0 0 0 Text1

#parse
function cmd:player/inventory/hotbar/cooldowns/update/sub/parse

#nbt merge
item modify entity @s hotbar.7 cmd:mergenbt
data remove storage cmd:var mergenbt

#COUNT SET
scoreboard players set 20 var 20
execute store result score setcount.in var run scoreboard players operation update.time var /= 20 var
scoreboard players add setcount.in var 1
item modify entity @s hotbar.7 cmd:setcount
scoreboard players reset setcount.in var
