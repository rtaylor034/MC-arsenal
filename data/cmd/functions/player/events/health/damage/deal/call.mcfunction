
#CALL - from health/damage/inflict/run
#DESC - called by a player when they deal any damage

#PASS - A (dealdamage.target -> var), B (inflict.dmg -> var), C (inflict.true -> var), D (inflict.type -> var),         E (inflict.noprotdmg -> var) | A playerid of target, B amount of damage, C is true damage?, D type of damage, E damage pre-mitigation
#PASSTYPE - A (read), B (read, set), C (read, set), D (read, set), E (set)

#NOTE - this player has the "damage-source" tag
#NOTE - this called right before event/health/damage/take is called, and passes all (PASS) vars to it.

#DAMAGE TYPE KEY
#1 = Melee
#2 = Ability
#3 = Effect


#TAG TARGET "damage-target"
execute as @a if score @s playerid = dealdamage.target var run tag @s add damage-target

#(PASS E) set
scoreboard players operation inflict.noprotdmg var = inflict.dmg var

#PROTECTION CALCULATION
#DEV - decided to move this here for more control of pre/post mitigation damage
#this directly affects (PASS B)
execute as @a[tag=damage-target] unless score inflict.true var matches 1 run function cmd:player/health/damage/inflict/protcalc

#TRACKER EXTRACT tdata
function cmd:player/tracker/findextract/run

#TRACKER STATISTICS
#add damage
execute store result score val var run data get storage cmd:var tdata.game.statistics.rounds[0].dmgDealt
scoreboard players operation val var += inflict.dmg var
execute store result storage cmd:var tdata.game.statistics.rounds[0].dmgDealt int 1 run scoreboard players get val var


#DEV LOG
tellraw @a ["",{"selector":"@s"}, {"text":" just dealt "},{"score":{"name":"inflict.noprotdmg","objective":"var"}},{"text":"->"},{"score":{"name":"inflict.dmg","objective":"var"}}, {"text":" damage of type "},{"score":{"name":"inflict.type","objective":"var"}}, {"text":" to player "}, {"score":{"name":"dealdamage.target","objective":"var"}}]


#TEMPORARY DEAL DAMAGE SOUND
execute unless score inflict.type var matches 1 run playsound minecraft:block.note_block.snare master @s ~ ~ ~ 1 2


#RESETS
function cmd:player/tracker/unfindinject/run
scoreboard players reset dealdamage.target var
tag @a remove damage-target
scoreboard players reset val var
