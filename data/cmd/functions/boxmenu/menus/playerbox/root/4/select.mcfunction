
#TEAM DISPLAY
#Called when page is selected by item (from events/onselection/call)
#template - {Slot:0b,id:"minecraft:stick",Count:1b,tag:{menu:{template:{s1:1}}}}


#display items
data modify storage cmd:var display.items set value []
data modify storage cmd:var display.items prepend value {Count:1b,Slot:0b,id:"minecraft:slime_ball",tag:{menu:{playerbox:1},display:{Name:'{"text":"Back"}'}}}
data modify storage cmd:var display.items[0].tag.CustomModelData set from storage cmd:controls/display itemIcon.back


function cmd:boxmenu/display/run
