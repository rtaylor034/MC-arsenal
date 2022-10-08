

#unlock
setblock ~ ~ ~ barrel
#fake selection
data modify storage cmd:var selection.item.tag.menu.playerbox set value 1
function cmd:boxmenu/events/onselection/call
data modify entity @s data.lastItems set from block ~ ~ ~ Items
