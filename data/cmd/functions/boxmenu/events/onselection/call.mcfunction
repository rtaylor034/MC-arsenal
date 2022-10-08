
#PASS - A [selection.item -> cmd:var = ItemSlot Obj], B [selection.refresh -> cmd:var = int] | selected item, was a refresh call?
#DESC - called when this boxmenu has an item taken out
#PASSTYPE - A (read), B (read)

#FIND PLAYER
#the owner of this box has the tag "boxmenu-owner"
scoreboard players operation boxmenu.temp var = @s playerid
execute as @a at @s if score @s playerid = boxmenu.temp var run tag @s add boxmenu-owner



#FEEDBACK (Must be before last selection saving and invalid selection)
execute unless data storage cmd:var selection.refresh run function cmd:boxmenu/events/onselection/feedback

#INVALID SELECTION (Must be before last selection saving)
#(invalid treated as a refresh)
execute if data storage cmd:var selection.item.tag.menu.tags.invalid run data modify storage cmd:var selection.refresh set value 1
execute if data storage cmd:var selection.item.tag.menu.tags.invalid run data modify storage cmd:var selection.item set from entity @s data.lastSelection.item

#SAVE LAST SELECTION
execute unless data storage cmd:var selection.refresh run data modify entity @s data.lastSelection set from storage cmd:var selection

#ref var
data modify storage cmd:var selection.menu set from storage cmd:var selection.item.tag.menu

#MENU DIRECTORIES
#playerbox root
execute if data storage cmd:var selection.menu.playerbox run function cmd:boxmenu/menus/playerbox/root/s1
#template
execute if data storage cmd:var selection.menu.template run function cmd:boxmenu/menus/template/root/s1


#LIST ACTIONS
execute if data storage cmd:var selection.item.tag.list run function cmd:boxmenu/events/onselection/listactions

#RESET
scoreboard players reset boxmenu.temp var
tag @a remove boxmenu-owner
data remove storage cmd:var selection
