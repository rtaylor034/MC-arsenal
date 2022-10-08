
#Called when page is selected by item (from events/onselection/call)
#template - {Slot:0b,id:"minecraft:stick",Count:1b,tag:{menu:{template:{s1:1}}}}

#NOTE - This box must have a playerid score corresponding to which players box this is.

#check tags
execute unless data storage cmd:var selection.refresh run function cmd:boxmenu/menus/playerbox/root/checktags

#store ready ref var
scoreboard players operation isready var = @p[tag=boxmenu-owner] prep_ready

#display items
data modify storage cmd:var display.items set value []

#ARMOR
#chestplate
data modify storage cmd:var display.items prepend value {Count:1b,Slot:1b,id:"minecraft:slime_ball",tag:{menu:{tags:{type:4,page:0},playerbox:{s1:1}},display:{Name:'{"text":"helmet","color":"dark_gray","italic":false}'}}}
function cmd:boxmenu/menus/playerbox/root/armor/parse

#leggings
data modify storage cmd:var display.items prepend value {Count:1b,Slot:2b,id:"minecraft:slime_ball",tag:{menu:{tags:{type:2,page:0},playerbox:{s1:1}},display:{Name:'{"text":"leggings","color":"dark_gray","italic":false}'}}}
function cmd:boxmenu/menus/playerbox/root/armor/parse

#helmet
data modify storage cmd:var display.items prepend value {Count:1b,Slot:10b,id:"minecraft:slime_ball",tag:{menu:{tags:{type:3,page:0},playerbox:{s1:1}},display:{Name:'{"text":"chestplate","color":"dark_gray","italic":false}'}}}
function cmd:boxmenu/menus/playerbox/root/armor/parse

#boots
data modify storage cmd:var display.items prepend value {Count:1b,Slot:11b,id:"minecraft:slime_ball",tag:{menu:{tags:{type:1,page:0},playerbox:{s1:1}},display:{Name:'{"text":"boots","color":"dark_gray","italic":false}'}}}
function cmd:boxmenu/menus/playerbox/root/armor/parse


#WEAPON
data modify storage cmd:var display.items prepend value {Count:1b,Slot:18b,id:"minecraft:carrot_on_a_stick",tag:{menu:{tags:{weapon:1,page:0},playerbox:{s1:5}},display:{Name:'{"text":"weapon","color":"dark_gray","italic":false}'}}}
function cmd:boxmenu/menus/playerbox/root/armor/parse


#CONSUMABLES
#SLOT 1
#base item
data modify storage cmd:var display.items prepend value {Count:1b,Slot:19b,id:"minecraft:slime_ball",tag:{menu:{tags:{slot:1,page:0},playerbox:{s1:3}},display:{Name:'{"text":"Empty","color":"dark_gray","italic":false}'}}}
#get consumable item
function cmd:boxmenu/menus/playerbox/root/consumable/parse
#SLOT 2
#base item
data modify storage cmd:var display.items prepend value {Count:1b,Slot:20b,id:"minecraft:slime_ball",tag:{menu:{tags:{slot:2,page:0},playerbox:{s1:3}},display:{Name:'{"text":"Empty","color":"dark_gray","italic":false}'}}}
#get consumable item
function cmd:boxmenu/menus/playerbox/root/consumable/parse
#SLOT 3
#base item
data modify storage cmd:var display.items prepend value {Count:1b,Slot:21b,id:"minecraft:slime_ball",tag:{menu:{tags:{slot:3,page:0},playerbox:{s1:3}},display:{Name:'{"text":"Empty","color":"dark_gray","italic":false}'}}}
#get consumable item
function cmd:boxmenu/menus/playerbox/root/consumable/parse
#SLOT 4
#base item
data modify storage cmd:var display.items prepend value {Count:1b,Slot:22b,id:"minecraft:slime_ball",tag:{menu:{tags:{slot:4,page:0},playerbox:{s1:3}},display:{Name:'{"text":"Empty","color":"dark_gray","italic":false}'}}}
#get consumable item
function cmd:boxmenu/menus/playerbox/root/consumable/parse


#ABILITIES
#DROP
data modify storage cmd:var display.items prepend value {Count:1b,Slot:23b,id:"minecraft:slime_ball",tag:{menu:{tags:{slot:1,page:0},playerbox:{s1:2}},display:{Name:'{"text":"Slot"}'}}}
function cmd:boxmenu/menus/playerbox/root/ability/parse
#SWAP
data modify storage cmd:var display.items prepend value {Count:1b,Slot:24b,id:"minecraft:slime_ball",tag:{menu:{tags:{slot:2,page:0},playerbox:{s1:2}},display:{Name:'{"text":"Slot"}'}}}
function cmd:boxmenu/menus/playerbox/root/ability/parse
#SNEAK
data modify storage cmd:var display.items prepend value {Count:1b,Slot:25b,id:"minecraft:slime_ball",tag:{menu:{tags:{slot:3,page:0},playerbox:{s1:2}},display:{Name:'{"text":"Slot"}'}}}
function cmd:boxmenu/menus/playerbox/root/ability/parse
#CLICK
data modify storage cmd:var display.items prepend value {Count:1b,Slot:26b,id:"minecraft:slime_ball",tag:{menu:{tags:{slot:4,page:0},playerbox:{s1:2}},display:{Name:'{"text":"Slot"}'}}}
function cmd:boxmenu/menus/playerbox/root/ability/parse


#CURRENCY
data modify storage cmd:var display.items prepend value {Count:1b,Slot:0b,id:"minecraft:emerald",tag:{menu:{tags:{invalid:1},playerbox:{}},display:{Name:'{"text":"Bank"}'}}}
function cmd:boxmenu/menus/playerbox/root/bank/parse


#READY INVALIDATION (MUST BE DIRECTLY BEFORE READY BUTTON)
execute if score @p[tag=boxmenu-owner] prep_ready matches 1.. run function cmd:boxmenu/menus/playerbox/root/ready/invalidatepage

#READY BUTTON (MUST BE LAST)
#/Do the ready check here, probably split ready/parse into multiple functions. There should not be a ready page, just keep on this page, but make all selections invalid when ready.
data modify storage cmd:var display.items prepend value {Count:1b,Slot:13b,id:"minecraft:slime_ball",tag:{menu:{playerbox:{}},display:{Name:'{"text":"Ready button","italic":false,"bold":false,"color":"dark_gray"}'}}}
function cmd:boxmenu/menus/playerbox/root/ready/parse


data modify storage cmd:var display.name set value '{"text":"Player Box"}'
function cmd:boxmenu/display/run

#RESETS
scoreboard players reset isready var
