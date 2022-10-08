
#ABILITY TYPE
#Called when page is selected by item (from events/onselection/call)
#template - {Slot:0b,id:"minecraft:stick",Count:1b,tag:{menu:{template:{s1:1}}}}



#ITEMS
data modify storage cmd:var display.items set value []

#attack
data modify storage cmd:var display.items prepend value {Count:1b,Slot:21b,id:"minecraft:slime_ball",tag:{menu:{tags:{type:1,page:0},playerbox:{s1:2}},display:{Name:'{"text":"Attack"}'}}}
data modify storage cmd:var display.items[0].tag.CustomModelData set from storage cmd:controls/display itemIcon.ability.attack
function cmd:boxmenu/menus/playerbox/root/2/parsesort

#movement
data modify storage cmd:var display.items prepend value {Count:1b,Slot:22b,id:"minecraft:slime_ball",tag:{menu:{tags:{type:2,page:0},playerbox:{s1:2}},display:{Name:'{"text":"Movement"}'}}}
data modify storage cmd:var display.items[0].tag.CustomModelData set from storage cmd:controls/display itemIcon.ability.movement
function cmd:boxmenu/menus/playerbox/root/2/parsesort

#utility
data modify storage cmd:var display.items prepend value {Count:1b,Slot:23b,id:"minecraft:slime_ball",tag:{menu:{tags:{type:3,page:0},playerbox:{s1:2}},display:{Name:'{"text":"Utility"}'}}}
data modify storage cmd:var display.items[0].tag.CustomModelData set from storage cmd:controls/display itemIcon.ability.utility
function cmd:boxmenu/menus/playerbox/root/2/parsesort

#defense
data modify storage cmd:var display.items prepend value {Count:1b,Slot:24b,id:"minecraft:slime_ball",tag:{menu:{tags:{type:4,page:0},playerbox:{s1:2}},display:{Name:'{"text":"Defense"}'}}}
data modify storage cmd:var display.items[0].tag.CustomModelData set from storage cmd:controls/display itemIcon.ability.defense
function cmd:boxmenu/menus/playerbox/root/2/parsesort

# weapon
data modify storage cmd:var display.items prepend value {Count:1b,Slot:25b,id:"minecraft:slime_ball",tag:{menu:{tags:{type:5,page:0},playerbox:{s1:2}},display:{Name:'{"text":"Weapon"}'}}}
data modify storage cmd:var display.items[0].tag.CustomModelData set from storage cmd:controls/display itemIcon.ability.weapon
function cmd:boxmenu/menus/playerbox/root/2/parsesort

#all
data modify storage cmd:var display.items prepend value {Count:1b,Slot:19b,id:"minecraft:slime_ball",tag:{menu:{tags:{page:0,type:0,all:1},playerbox:{s1:2}},display:{Name:'{"text":"all"}'}}}
data modify storage cmd:var display.items[0].tag.CustomModelData set from storage cmd:controls/display itemIcon.x
function cmd:boxmenu/menus/playerbox/root/2/parsesort

#SET TAGS
data modify storage cmd:process/array/mergetoall array set from storage cmd:var display.items
data modify storage cmd:process/array/mergetoall tag.tag.menu.tags.slot set from storage cmd:var selection.menu.tags.slot
function cmd:process/array/mergetoall/run
data modify storage cmd:var display.items set from storage cmd:process/array/mergetoall out

#back
data modify storage cmd:var display.items prepend value {Count:1b,Slot:0b,id:"minecraft:slime_ball",tag:{menu:{playerbox:{}},display:{Name:'{"text":"[Back]","color":"gray","bold":true,"italic":false}'}}}
data modify storage cmd:var display.items[0].tag.CustomModelData set from storage cmd:controls/display itemIcon.back


#LIST
#page
execute store result score display.list.page var run data get storage cmd:var selection.menu.tags.page

#GET ABILITY LIST (team)
data modify storage cmd:process/array/cycleto array set from storage cmd:storage/playerboxes abilities
execute store result storage cmd:process/array/cycleto tag.team int 1 run scoreboard players get @s team
function cmd:process/array/cycleto/run

#GET ABILITY LIST (matching type)
data modify storage cmd:process/array/getmatching array set from storage cmd:process/array/cycleto out[0].array
data modify storage cmd:process/array/getmatching tag.type set from storage cmd:var selection.menu.tags.type
function cmd:process/array/getmatching/run
#type null case (all abilities displayed, no sort)
execute if data storage cmd:var selection.menu.tags.all run data modify storage cmd:process/array/getmatching out set from storage cmd:process/array/cycleto out[0].array

#base
data modify storage cmd:var display.list.items set value []

#get ability item for each ability (uses removal, not i)
execute if data storage cmd:process/array/getmatching out[] run function cmd:boxmenu/menus/playerbox/root/2/foreachability

#set item tags
data modify storage cmd:var display.list.itemtag.menu set value {tags:{equip:1}}
data modify storage cmd:var display.list.itemtag.menu.tags merge from storage cmd:var selection.menu.tags

#scoreboard players set test.i var 80
#function cmd:dev/tester


#DISPLAY LIST
data modify storage cmd:var display.list merge value {xspace:[1,2,3,4,5,6,7],yspace:[0,1],prevPageSlot:9b,nextPageSlot:17b}

function cmd:boxmenu/display/list/run













#DISPLAY
function cmd:boxmenu/display/run
