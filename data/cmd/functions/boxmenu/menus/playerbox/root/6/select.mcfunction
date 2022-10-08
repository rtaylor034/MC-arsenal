
#READY SCREEN
#Called when page is selected by item (from events/onselection/call)
#template - {Slot:0b,id:"minecraft:stick",Count:1b,tag:{menu:{template:{s1:1}}}}

function cmd:boxmenu/menus/playerbox/root/ready/ready

#display items
data modify storage cmd:var display.items set value []

#Unready button
data modify storage cmd:var display.items prepend value {Count:1b,Slot:13b,id:"minecraft:slime_ball",tag:{menu:{playerbox:{},tags:{unready:1}},display:{Name:'{"text":"[Unready]","italic":false,"bold":true,"color":"red"}'}}}
function cmd:boxmenu/menus/playerbox/root/ready/parse


function cmd:boxmenu/display/run
