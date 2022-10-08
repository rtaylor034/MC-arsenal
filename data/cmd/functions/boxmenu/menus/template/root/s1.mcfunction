
#boxmenu navigation branch

#ref var
### CHANGE THIS ###
data modify storage cmd:var selection.path set from storage cmd:var selection.menu.template

#STORE S VALUE
execute store result score menu.s1 var run data get storage cmd:var selection.path.s1

#BRANCH
### CHANGE FUNCTION PATHS ###
execute if score menu.s1 var matches 1 run function cmd:boxmenu/menus/template/root/path1/s2
execute if score menu.s1 var matches 2 run function cmd:boxmenu/menus/template/root/path2/s2




#SELECT
### CHANGE FUNCTION PATH ###
execute unless data storage cmd:var selection.path.s1 run function cmd:boxmenu/menus/template/root/select

#RESET
scoreboard players reset menu.s1 var
