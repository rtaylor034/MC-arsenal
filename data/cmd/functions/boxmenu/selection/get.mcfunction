
#CALL - boxmenu/selection/check
#called when lastItems do not match Items


#for each item
execute store result score get.i var if data storage cmd:var check.lastItems[]
execute store result score get.itemcount var if data storage cmd:var check.Items[]
#if itemcount is greater than i, an item was added to the box, not taken.
execute if score get.itemcount var < get.i var run function cmd:boxmenu/selection/foreachitem

#pass var [selection.item -> cmd:var]
#EVENT CALL: onselection
execute if score get.found var matches 1 run function cmd:boxmenu/events/onselection/call


#set box items back if item was not found
execute unless score get.found var matches 1 run data modify block ~ ~ ~ Items set from storage cmd:var check.lastItems

#boxmenu item clear
clear @a #cmd:allitems{boxmenu:1}

execute unless score get.found var matches 1 run say NOT FOUND


#RESETS
scoreboard players reset get.player
scoreboard players reset get.i var
scoreboard players reset get.itemcount var
scoreboard players reset get.found var
