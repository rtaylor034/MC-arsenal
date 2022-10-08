
#ARMOR
#Called when page is selected by item (from events/onselection/call)
#template - {Slot:0b,id:"minecraft:stick",Count:1b,tag:{menu:{template:{s1:1}}}}


#display items
data modify storage cmd:var display.items set value []
data modify storage cmd:var display.items prepend value {Count:1b,Slot:0b,id:"minecraft:slime_ball",tag:{menu:{playerbox:1},display:{Name:'{"text":"[Back]","color":"gray","bold":true,"italic":false}'}}}
data modify storage cmd:var display.items[0].tag.CustomModelData set from storage cmd:controls/display itemIcon.back


#LIST
#page
execute store result score display.list.page var run data get storage cmd:var selection.menu.tags.page

#GET STATS
data modify storage cmd:var boxmenu.root.1.stats set from storage cmd:controls/armor statIdentities.armor

#base
data modify storage cmd:var display.list.items set value []

#get stat item for each stat (uses removal, not i)
execute if data storage cmd:var boxmenu.root.1.stats[] run function cmd:boxmenu/menus/playerbox/root/1/foreachstat

#set item tags
data modify storage cmd:var display.list.itemtag.menu set value {tags:{upgrade:1},playerbox:{}}
data modify storage cmd:var display.list.itemtag.menu.tags merge from storage cmd:var selection.menu.tags



#DISPLAY LIST
data modify storage cmd:var display.list merge value {xspace:[3,4,5],yspace:[1,2],prevPageSlot:11b,nextPageSlot:15b}

function cmd:boxmenu/display/list/run
