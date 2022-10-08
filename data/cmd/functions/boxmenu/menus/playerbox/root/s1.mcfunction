
#boxmenu navigation branch


#ref var
data modify storage cmd:var selection.path set from storage cmd:var selection.menu.playerbox

#STORE S VALUE
execute store result score menu.s1 var run data get storage cmd:var selection.path.s1



#BRANCH
# 1 armor
execute if score menu.s1 var matches 1 run function cmd:boxmenu/menus/playerbox/root/1/s2

# 2 abilities
execute if score menu.s1 var matches 2 run function cmd:boxmenu/menus/playerbox/root/2/s2

# 3 consumables
execute if score menu.s1 var matches 3 run function cmd:boxmenu/menus/playerbox/root/3/select

# 4 show teammates
execute if score menu.s1 var matches 4 run function cmd:boxmenu/menus/playerbox/root/4/s2

# 5 weapon
execute if score menu.s1 var matches 5 run function cmd:boxmenu/menus/playerbox/root/5/s2

# 6 ready
execute if score menu.s1 var matches 6 run function cmd:boxmenu/menus/playerbox/root/6/s2




#SELECT
execute unless data storage cmd:var selection.path.s1 run function cmd:boxmenu/menus/playerbox/root/select

#RESET
scoreboard players reset menu.s1 var
data remove storage cmd:var boxmenu.root
