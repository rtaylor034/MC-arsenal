
#iterates through lastItems and Items until an item does not match

#DECRIMENT
scoreboard players remove get.i var 1

#find var
data modify storage cmd:var check.find set from storage cmd:var check.Items[0]

#COMPARE
execute store result score get.found var run data modify storage cmd:var check.find set from storage cmd:var check.lastItems[0]

#STORE OUT
execute if score get.found var matches 1 run data modify storage cmd:var selection.item set from storage cmd:var check.lastItems[0]

#CYCLE
data modify storage cmd:var check.lastItems append from storage cmd:var check.lastItems[0]
data remove storage cmd:var check.lastItems[0]
data modify storage cmd:var check.Items append from storage cmd:var check.Items[0]
data remove storage cmd:var check.Items[0]


#LOOP
execute unless score get.found var matches 1 if score get.i var matches 1.. run function cmd:boxmenu/selection/foreachitem
