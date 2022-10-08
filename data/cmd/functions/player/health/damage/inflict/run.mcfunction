
#IN - @s, A (inflict.dmg -> var), B (inflict.source -> var), C (inflict.true -> var) D (inflict.type -> var)| target, damage, source playerid, is true damage?, damage type
#OUT - A (inflict.dealt -> var), B (inflict.killed -> var) | damage dealt, did it kill?

#USE - Standard process to call for damaging a player. Deals (IN A) damage to this player. if (IN C) is 1, then the damage is treated as true damage, ignoring protection. (IN B) should be set to the playerid of the player dealing the damage. (IN D) is mainly an event PASS variable that specifies what type of damage is being dealt, but still is important to set.

#NOTE - Call this process from the player taking damage.
#NOTE - This process should be used for *ANY AND ALL* damage dealt unless it is a VERY special and controlled case. This is because this process deals with all of the events that go along with damage.
#NOTE - (OUT A) returns the amount of HEALTH damage dealt, not shield.
#NOTE - all IN values are reset after usage.

#DAMAGE TYPE KEY
#1 = Melee
#2 = Ability
#3 = Effect

#DEFAULT SETS
scoreboard players set inflict.killed var 0

#EVENT CALL: health/damage/deal
scoreboard players operation dealdamage.target var = @s playerid
execute as @a if score @s playerid = inflict.source var run tag @s add damage-source
execute as @a[tag=damage-source] at @s run function cmd:player/events/health/damage/deal/call
tag @a remove damage-source


#EVENT CALL: health/damage/take
function cmd:player/events/health/damage/take/call

#SHIELD DAMAGE
scoreboard players operation inflict.temp var = inflict.dmg var
scoreboard players operation inflict.dmg var -= @s shield
scoreboard players operation @s shield -= inflict.temp var

#clamp
execute as @s[scores={shield=..-1}] run scoreboard players set @s shield 0
execute if score inflict.dmg var matches ..-1 run scoreboard players set inflict.dmg var 0


#HEALTH DAMAGE
scoreboard players operation @s health -= inflict.dmg var
execute as @s[scores={health=..-1}] run scoreboard players set @s health 0

#HEALTH BAR UPDATE
scoreboard players operation update.change var = inflict.dmg var
function cmd:player/bars/health/update/run



#EVENT CALL: health/zero
#(OUT B) is set in this event
execute as @s[scores={health=..0}] run function cmd:player/events/health/zero/call

#HEALTH ATTRIBUTE UPDATE
tag @s add attupdate

#OUT
scoreboard players operation inflict.dealt var = inflict.dmg var

#RESETS
scoreboard players reset inflict.temp var
scoreboard players reset inflict.dmg var
scoreboard players reset inflict.true var
scoreboard players reset inflict.source var
scoreboard players reset inflict.type var
