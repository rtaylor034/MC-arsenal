
#removes elements of (IN A) for the page offset

#DECRIMENT
scoreboard players remove display.list.offset var 1

#remove
data remove storage cmd:var display.list.items[0]

#LOOP
execute if score display.list.offset var matches 1.. run function cmd:boxmenu/display/list/pageoffset
