
#CALL - cmd:player/events/advancement/melee/deal
#DESC - Called by player when they melee attack someone.
#PASS - (melee.target -> var) | target playerid
#PASSTYPE - (read)






#MELEE TIMER
function cmd:player/systems/meleetimer/set



#BASE MELEE DAMAGE SET
#find target
execute as @a if score @s playerid = melee.target var run tag @s add melee_target
#params
scoreboard players operation inflict.dmg var = @s weap_dmg
scoreboard players operation inflict.source var = @s playerid
scoreboard players set inflict.true var 0
scoreboard players set inflict.type var 1

#DAMAGE CALL
execute as @a[tag=melee_target] at @s run function cmd:player/health/damage/inflict/run
#tag reset
tag @a remove melee_target


#LOG
#say I have melee attacked
