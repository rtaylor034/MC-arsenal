
#USE - initializes this boxmenu entity with playerbox data and intializes storage for abilities | AFFECTS [abilities -> cmd:storage/playerboxes]
#CONTEXT - Console




#RESETS
data modify storage cmd:storage/playerboxes abilities set value []

#INDIVIDUAL
execute as @e[type=marker,tag=playerbox] at @s run function cmd:boxmenu/menus/playerbox/initall/indiv
