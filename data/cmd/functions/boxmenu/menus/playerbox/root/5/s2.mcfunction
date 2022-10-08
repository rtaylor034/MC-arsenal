
#TEAM DISPLAY
#boxmenu navigation branch

#STORE S VALUE
execute store result score menu.s2 var run data get storage cmd:var selection.path.s2


#BRANCH



#SELECT
execute unless data storage cmd:var selection.path.s2 run function cmd:boxmenu/menus/playerbox/root/5/select

#RESET
scoreboard players reset menu.s2 var
