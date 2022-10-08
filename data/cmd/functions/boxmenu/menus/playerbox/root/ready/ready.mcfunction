

#Uneady player
scoreboard players set set.ready var 1
execute as @p[tag=boxmenu-owner] at @s run function cmd:player/game/ready/set/run

#refresh
tag @e[type=marker,tag=boxmenu,distance=1..] add boxmenu-refresh
function cmd:boxmenu/refresh/run
