
#adds an item to the out array

#add item
data modify storage cmd:var display.list.out prepend from storage cmd:var display.list.items[0]

#slot
execute store result storage cmd:var display.list.out[0].Slot byte 1 run scoreboard players get display.list.slot var

# item tag
data modify storage cmd:var display.list.out[0].tag merge from storage cmd:var display.list.itemtag


#remove item
data remove storage cmd:var display.list.items[0]
