
#USE - initializes this boxmenu entity with playerbox data
#CONTEXT - this

#RESETS
data modify entity @s data set value {}

#ABILITIES (stored in storage based on team)
data modify storage cmd:process/array/cycleto array set from storage cmd:storage/playerboxes abilities
execute store result storage cmd:process/array/cycleto tag.team int 1 run scoreboard players get @s team
function cmd:process/array/cycleto/run
execute unless score cycleto.out var matches 1 run function cmd:boxmenu/menus/playerbox/initall/addteam



#PASSIVES
data modify entity @s data.storage.passives set from storage cmd:controls/armor passives

#fake selection
data modify storage cmd:var selection.item.tag.menu.playerbox set value 1
function cmd:boxmenu/events/onselection/call
data modify entity @s data.lastItems set from block ~ ~ ~ Items
