
#boxmenu navigation branch

## FOR CONVENIENCE JUST COPY THE "s1" FROM ROOT SO YOU DONT HAVE TO RENAME A BUCNH OF STUFF ##

#STORE S VALUE
execute store result score menu.s2 var run data get storage cmd:var selection.path.s2


#BRANCH
execute if score menu.s2 var matches 1 run function cmd:boxmenu/menus/template/root/path2/subpath1/select
execute if score menu.s2 var matches 2 run function cmd:boxmenu/menus/template/root/path2/subpath2/select





#SELECT
execute unless data storage cmd:var selection.path.s2 run function cmd:boxmenu/menus/template/root/path2/select

#RESET
scoreboard players reset menu.s2 var
