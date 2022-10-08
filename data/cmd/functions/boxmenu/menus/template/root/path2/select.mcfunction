
#Called when page is selected by item (from events/onselection/call)
#template - {Slot:0b,id:"minecraft:stick",Count:1b,tag:{menu:{template:{s1:1}}}}


data modify storage cmd:var display.items set value [{Slot:0b,id:"minecraft:redstone_block",Count:1b,tag:{menu:{template:1}}},{Slot:4b,id:"minecraft:stone",Count:2b,tag:{menu:{template:{s1:2}}}},{Slot:11b,id:"minecraft:stick",Count:1b,tag:{menu:{template:{s1:2,s2:1}}}},{Slot:15b,id:"minecraft:stick",Count:2b,tag:{menu:{template:{s1:2,s2:2}}}}]

data modify storage cmd:var display.name set value '{"text":"2"}'

function cmd:boxmenu/display/run
