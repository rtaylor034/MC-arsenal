
#IN - A [display.items -> cmd:var = Array<ItemSlot Obj>] | Items
#IN OPT - b [display.name -> cmd:var = Json Text], c (display.keep -> var) | Box name, keep previous items?
#OUT - N/A

#USE - call to display the array of items specified in (IN A). additionally changes the name of this box to (IN b). if (IN c) is set to 1, then instead of replacing the entire Item array in this box, (IN A) will be added to the items already being displayed.

#NOTE - Name changes of the box are only visible when a player closes and re-opens the barrel.
#NOTE - this assumes that (IN) account for slots

#adds tag {boxmenu:1} to each item
execute store result score display.i var if data storage cmd:var display.items[]
execute if score display.i var matches 1.. run function cmd:boxmenu/display/foreachitem

data modify entity @s data.lastItems set from storage cmd:var display.items
execute unless score display.keep var matches 1.. run data modify block ~ ~ ~ Items set from storage cmd:var display.items
execute if score display.keep var matches 1.. run data modify block ~ ~ ~ Items append from storage cmd:var
#NAME
data modify block ~ ~ ~ CustomName set from storage cmd:var display.name


#RESETS
data remove storage cmd:var display
scoreboard players reset display.i var
scoreboard players reset display.keep var
