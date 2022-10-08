
#cycles through each element of (IN B)

#DECRIMENT
scoreboard players remove display.list.cols var 1

#col score
execute store result score display.list.x var run data get storage cmd:var display.list.xspace[0]

#create slot
scoreboard players set display.list.slot var 9
scoreboard players operation display.list.slot var *= display.list.y var
scoreboard players operation display.list.slot var += display.list.x var
execute if data storage cmd:var display.list.items[0] run function cmd:boxmenu/display/list/additem


#CYCLE
data modify storage cmd:var display.list.xspace append from storage cmd:var display.list.xspace[0]
data remove storage cmd:var display.list.xspace[0]


#LOOP
execute if score display.list.cols var matches 1.. run function cmd:boxmenu/display/list/foreachcol
