
#CALL - player/main
#DESC - Called from all players that have a playerstate of 1

#TP
#scoreboard players operation tracktp.id var = @s playerid
#execute as @e[type=minecraft:marker,tag=tracker] if score @s playerid = tracktp.id var run tag @s add tracktp
#tp @e[type=marker,tag=tracktp] @s
#tag @e[type=marker] remove tracktp
#scoreboard players reset tracktp.id var


#TRACKER
function cmd:player/tracker/find/run
execute as @e[type=minecraft:marker,tag=track] at @s run function cmd:player/tracker/base
function cmd:player/tracker/unfind/run

#SYSTEMS
function cmd:player/systems/hunger/base
function cmd:player/systems/meleetimer/base
function cmd:player/systems/energy/regen/base
function cmd:player/systems/inventory/base
function cmd:player/systems/bars/base

#ARMOR
execute as @s[tag=!noarmor] run function cmd:player/armor/equip/check

#RODCLICK EVENT
execute as @s[scores={rodclick=1..}] at @s run function cmd:player/events/action/rodclick/call


#ABILITY SLOTS
#drop check
execute as @s[scores={drop=1..}] at @s run function cmd:player/events/action/drop/call

#UPDATES
#(this probably should be ran last)
#IMPORTANT - statupdate MUST come before attupdate
execute as @s[tag=statupdate] run function cmd:player/stats/update
execute as @s[tag=attupdate] run function cmd:player/attributes/update
execute as @s[tag=barupdate] run function cmd:player/bars/update

#TEMP
#quick effects (put this in somewhere more organized later)
effect give @s minecraft:resistance 100000 127 true
effect give @s instant_health 10 2 true
effect give @s minecraft:jump_boost 100000 1 true
