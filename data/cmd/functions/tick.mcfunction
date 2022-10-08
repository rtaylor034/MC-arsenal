
#FIRSTJOIN
execute as @a[tag=!joined] at @s run function cmd:firstjoin

#MAINS
execute as @a at @s run function cmd:player/main
execute as @e[type=marker,tag=boxmenu] at @s run function cmd:boxmenu/main
