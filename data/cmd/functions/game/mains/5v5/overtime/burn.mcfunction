
#CALL - mains/5v5/overtime/main
#CONTEXT - @s

#burns every alive player for 1 health every tick

#BURN
scoreboard players remove @s health 1
execute as @s[scores={health=..-1}] run scoreboard players set @s health 0

#HEALTH BAR UPDATE
#/uncessary update.change assignment?
scoreboard players operation update.change var = inflict.dmg var
function cmd:player/bars/health/update/run

#EVENT CALL: health/zero
#(OUT B) is set in this event
execute as @s[scores={health=..0}] run function cmd:player/events/health/zero/call

#HEALTH ATTRIBUTE UPDATE
tag @s add attupdate
