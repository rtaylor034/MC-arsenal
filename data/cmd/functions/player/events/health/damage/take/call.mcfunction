
#CALL - from health/damage/inflict/run
#DESC - called by player when damage is to be inflicted upon them. this event is called BEFORE damage is applied.

#PASS - A (inflict.dmg -> var), B (inflict.noprotdmg -> var), C (inflict.source -> var), D (inflict.true -> var), E (inflict.type -> var) | A damage dealt, B damage before armor calculation, C damage source playerid, D is true damage?, E type of damage
#PASSTYPE - A (read set), B (read), C (read set), D (read set), E (read, set)


#NOTE - this is called after protection calculation, and after event/health/damage/deal is called

#DAMAGE TYPE KEY
#1 = Melee
#2 = Ability
#3 = Effect





#TRACKER EXTRACT tdata
function cmd:player/tracker/findextract/run

#TRACKER STATISTICS
#add damage
execute store result score val var run data get storage cmd:var tdata.game.statistics.rounds[0].dmgTaken
scoreboard players operation val var += inflict.dmg var
execute store result storage cmd:var tdata.game.statistics.rounds[0].dmgTaken int 1 run scoreboard players get val var


#TEMPORARY TAKE DAMAGE SOUND
playsound minecraft:entity.snowball.throw master @a ~ ~ ~ 0.8 2
playsound minecraft:entity.player.hurt master @s ~ ~ ~ 0.8 1.1






#LOG
tellraw @a ["",{"selector":"@s"},{"text":" just took "},{"score":{"name":"inflict.dmg","objective":"var"}},{"text":" damage of type "},{"score":{"name":"inflict.type","objective":"var"}}, {"text":" from player "}, {"score":{"name":"inflict.source","objective":"var"}}]


#RESETS
function cmd:player/tracker/unfindinject/run
scoreboard players reset inflict.noprotdmg var
scoreboard players reset val var
