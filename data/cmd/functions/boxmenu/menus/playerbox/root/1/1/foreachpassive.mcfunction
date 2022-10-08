
#gets each stats item and adds it to (display.list.items -> var)


#get data
execute store result score get.statid var run data get storage cmd:var boxmenu.root.1.1.passives[0].id
function cmd:modeldata/passive/get/run

#PARSE
execute if data storage cmd:var boxmenu.root.1.1.passives[0].equipped run function cmd:boxmenu/menus/playerbox/root/1/1/parseinvalid
execute unless data storage cmd:var boxmenu.root.1.1.passives[0].equipped run function cmd:boxmenu/menus/playerbox/root/1/1/parsevalid


#send item to back of array
#this is to keep items in correct order, instead of reverse, because items are prepended
data modify storage cmd:var display.list.items append from storage cmd:var display.list.items[0]
data remove storage cmd:var display.list.items[0]



#loop
data remove storage cmd:var boxmenu.root.1.1.passives[0]
execute if data storage cmd:var boxmenu.root.1.1.passives[] run function cmd:boxmenu/menus/playerbox/root/1/1/foreachpassive
