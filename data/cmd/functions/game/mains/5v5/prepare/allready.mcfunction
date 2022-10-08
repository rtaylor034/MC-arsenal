
#CALL - player/game/ready/set/run

#/temporary lock method
execute as @e[tag=playerbox] at @s run setblock ~ ~ ~ redstone_block

scoreboard players set timer GAME 5
scoreboard players set ticking GAME 1

tellraw @a {"text":"PLAYERBOXES LOCKED"}
