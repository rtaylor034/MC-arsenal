
#Called when page is selected by item (from events/onselection/call)
#template - {Slot:0b,id:"minecraft:stick",Count:1b,tag:{menu:{template:{s1:1}}}}

#NOTE - This box must have a playerid score corresponding to which players box this is.


#buy text
data modify storage cmd:var display.items[0].tag.display.Lore prepend value '{"text":"[Select]","color":"gold","bold":true,"italic":false}'
