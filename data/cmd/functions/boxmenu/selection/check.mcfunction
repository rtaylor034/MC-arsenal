
#CALL - boxmenu/active/base
#called every tick

#NOTE - all items inside a box menu must have the tag {boxmenu:1}
#NOTE - if switching pages to display, remember to set {data.lastItems -> @s} to that page of items. this is to prevent the check thinking that an item was selected when switching items to display.

data modify storage cmd:var check.lastItems set from entity @s data.lastItems
data modify storage cmd:var check.checkItems set from storage cmd:var check.lastItems
data modify storage cmd:var check.Items set from block ~ ~ ~ Items
execute store success score check.success var run data modify storage cmd:var check.checkItems set from storage cmd:var check.Items

#GET SELECTION
execute if score check.success var matches 1 run function cmd:boxmenu/selection/get


#STORE CONTENTS
data modify entity @s data.lastItems set from block ~ ~ ~ Items

#RESETS
scoreboard players reset check.success var
data remove storage cmd:var check
