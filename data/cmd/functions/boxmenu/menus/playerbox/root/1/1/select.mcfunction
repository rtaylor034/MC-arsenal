
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

#GET PASSIVES
execute if data storage cmd:var selection.menu.tags.weapon run data modify storage cmd:var boxmenu.root.1.1.passives set from storage cmd:controls/armor weapon.passives
execute unless data storage cmd:var selection.menu.tags.weapon run data modify storage cmd:var boxmenu.root.1.1.passives set from entity @s data.storage.passives

#base
data modify storage cmd:var display.list.items set value []

#get stat item for each stat (uses removal, not i)
execute if data storage cmd:var boxmenu.root.1.1.passives[] run function cmd:boxmenu/menus/playerbox/root/1/1/foreachpassive

#set item tags
data modify storage cmd:var display.list.itemtag.menu set value {tags:{activate:1}}
data modify storage cmd:var display.list.itemtag.menu.tags merge from storage cmd:var selection.menu.tags



#DISPLAY LIST
data modify storage cmd:var display.list merge value {xspace:[2,3,4,5,6],yspace:[0,1],prevPageSlot:10b,nextPageSlot:16b}

function cmd:boxmenu/display/list/run
