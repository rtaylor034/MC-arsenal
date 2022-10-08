
#ARMOR
#boxmenu navigation branch

#STORE S VALUE
execute store result score menu.s2 var run data get storage cmd:var selection.path.s2


#BRANCH
# passive
execute if score menu.s2 var matches 1 run function cmd:boxmenu/menus/playerbox/root/1/1/select



#SELECT
execute unless data storage cmd:var selection.path.s2 run function cmd:boxmenu/menus/playerbox/root/1/select

#RESET
scoreboard players reset menu.s2 var
