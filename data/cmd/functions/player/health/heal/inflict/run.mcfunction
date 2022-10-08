
#IN - @s, A (inflict.health -> var), B (inflict.source -> var) | heal amount, source playerid
#OUT - A (inflict.healed -> var) | health healed.

#USE - Standard process for healing a player. Heals this player for (IN A). the playerid specified by (IN B) is attributed to the healing (set it to this player's id if it is a self heal).

#NOTE - Call this process from the player healing.
#NOTE - This process should be used for *ANY AND ALL* damage healed unless it is a VERY special and controlled case. This is because this process deals with all of the events that go along with healing.
#NOTE - all IN values are reset after usage.


#EVENT CALL: health/heal/deal
scoreboard players operation heal.target var = @s playerid
execute as @a if score @s playerid = inflict.source var run tag @s add heal-source
execute as @a[tag=heal-source] at @s run function cmd:player/events/health/heal/deal/call
tag @a remove heal-source


#EVENT CALL: health/heal/take
function cmd:player/events/health/heal/take/call

#HEAL
execute if score inflict.health var matches ..-1 run scoreboard players set inflict.health var 0
execute store result score inflict.temp var run scoreboard players operation @s health += inflict.health var


#OUT
scoreboard players operation inflict.temp var -= @s max_health
scoreboard players operation inflict.healed var = inflict.health var
execute if score inflict.temp var matches 1.. run scoreboard players operation inflict.healed var -= inflict.temp var

#CLAMP
execute if score @s health > @s max_health run scoreboard players operation @s health = @s max_health

#HEALTH BAR UPDATE
function cmd:player/bars/health/update/run

#HEALTH ATTRIBUTE UPDATE
tag @s add attupdate


#RESETS
scoreboard players reset inflict.temp var
scoreboard players reset inflict.health var
scoreboard players reset inflict.source var
