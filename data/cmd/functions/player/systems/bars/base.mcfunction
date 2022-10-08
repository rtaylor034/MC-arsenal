
#CALL - player/playerstates/ingame/alive
#Called from all players

#bar timer
#scoreboard players remove @s bar_health_timer 1
#execute if score @s bar_health_timer matches ..0 run function cmd:player/bars/health/update/run

#find
scoreboard players operation bartp.id var = @s playerid
execute as @e[type=minecraft:armor_stand,tag=bar] if score @s playerid = bartp.id var run tag @s add bartp
#stack
scoreboard players set bars.stack var 1
execute as @e[type=minecraft:armor_stand,tag=bartp] if score @s barstack = bars.stack var positioned ~ ~2 ~ run function cmd:player/systems/bars/barstack



#RESETS
scoreboard players reset bars.stack
