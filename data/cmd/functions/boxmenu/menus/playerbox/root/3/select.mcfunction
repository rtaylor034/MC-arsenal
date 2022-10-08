
#CONSUMABLE LIST
#Called when page is selected by item (from events/onselection/call)
#template - {Slot:0b,id:"minecraft:stick",Count:1b,tag:{menu:{template:{s1:1}}}}


#PAGE
execute store result score display.list.page var run data get storage cmd:var selection.menu.tags.page

#ITEMS
data modify storage cmd:var display.items set value []

#back
data modify storage cmd:var display.items prepend value {Count:1b,Slot:0b,id:"minecraft:slime_ball",tag:{menu:{playerbox:{}},display:{Name:'{"text":"[Back]","color":"gray","bold":true,"italic":false}'}}}
data modify storage cmd:var display.items[0].tag.CustomModelData set from storage cmd:controls/display itemIcon.back

#LIST
data modify storage cmd:var display.list.items set value []

#get ability item for each consumable (uses removal, not i)
data modify storage cmd:var boxmenu.3.consumables set from storage cmd:controls/consumables array
execute if data storage cmd:var boxmenu.3.consumables[] run function cmd:boxmenu/menus/playerbox/root/3/foreachconsumable

#set item tags
#data modify storage cmd:var display.list.itemtag.menu set value {tags:{buy:1},playerbox:{s1:2}}
data modify storage cmd:var display.list.itemtag.menu.tags.slot set from storage cmd:var selection.menu.tags.slot

#scoreboard players set test.i var 80
#function cmd:dev/tester

#DISPLAY LIST
data modify storage cmd:var display.list merge value {xspace:[1,2,3,4,5,6,7],yspace:[0,1,2],prevPageSlot:9b,nextPageSlot:17b}

function cmd:boxmenu/display/list/run

#resets
data remove storage cmd:var boxmenu.3
