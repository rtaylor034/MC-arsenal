
#cycles through each element of (IN C)

#DECRIMENT
scoreboard players remove display.list.rows var 1


#row score
execute store result score display.list.y var run data get storage cmd:var display.list.yspace[0]

#foreach column/x
execute store result score display.list.cols var if data storage cmd:var display.list.xspace[]
execute if score display.list.cols var matches 1.. run function cmd:boxmenu/display/list/foreachcol


#CYCLE
data modify storage cmd:var display.list.yspace append from storage cmd:var display.list.yspace[0]
data remove storage cmd:var display.list.yspace[0]


#LOOP
execute if score display.list.rows var matches 1.. run function cmd:boxmenu/display/list/foreachrow
