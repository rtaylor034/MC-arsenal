
#boxmenu navigation branch

#STORE S VALUE
execute store result score menu.s2 var run data get storage cmd:var selection.path.s2


#BRANCH
execute if score menu.s2 var matches 1 run function cmd:boxmenu/menus/template/root/path1/subpath1/select
execute if score menu.s2 var matches 2 run function cmd:boxmenu/menus/template/root/path1/subpath2/select





#SELECT
execute unless data storage cmd:var selection.path.s2 run function cmd:boxmenu/menus/template/root/path1/select

#RESET
scoreboard players reset menu.s2 var
