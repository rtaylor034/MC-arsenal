
#selects as targets

#get last selection
data modify storage cmd:var selection set from entity @s data.lastSelection
data modify storage cmd:var selection.refresh set value 1

#EVENT CALL: onselection
function cmd:boxmenu/events/onselection/call
data modify entity @s data.lastItems set from block ~ ~ ~ Items
