
#updates the swap slot (hotbar 6)

#NOTE - update.time stores the ability time
#DEVNOTE - CustomModelData support yet to be impemented


#ITEM SET
execute if score update.time var matches ..0 run item replace entity @s hotbar.6 with leather_helmet{CustomModelData:1,customtags:{hotbar:6,cooldownslot:2}}
execute if score update.time var matches 1.. run item replace entity @s hotbar.6 with gray_dye{CustomModelData:1,customtags:{hotbar:6,cooldownslot:2}}

#keybind text set
data modify block 0 0 0 front_text.messages[0] set value '{"keybind":"key.swapOffhand"}'
data modify storage cmd:var update.keybind set from block 0 0 0 front_text.messages[0]

#parse
function cmd:player/inventory/hotbar/cooldowns/update/sub/parse

#nbt merge
item modify entity @s hotbar.6 cmd:mergenbt
data remove storage cmd:var mergenbt

#COUNT SET
scoreboard players set 20 var 20
execute store result score setcount.in var run scoreboard players operation update.time var /= 20 var
scoreboard players add setcount.in var 1
item modify entity @s hotbar.6 cmd:setcount
scoreboard players reset setcount.in var
