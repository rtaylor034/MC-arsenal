
#iterates through lastItems and Items until an item does not match

#DECRIMENT
scoreboard players remove display.i var 1


#ADD TAG
data modify storage cmd:var display.items[0].tag.boxmenu set value 1

#CYCLE
data modify storage cmd:var display.items append from storage cmd:var display.items[0]
data remove storage cmd:var display.items[0]


#LOOP
execute if score display.i var matches 1.. run function cmd:boxmenu/display/foreachitem
