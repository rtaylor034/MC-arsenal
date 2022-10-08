
#CALL - from health/heal/inflict/run
#DESC - called by player when they are healed. this event is called BEFORE damage is applied.

#PASS - A (inflict.heal -> var), B (inflict.source -> var) | A health healed, B source playerid of healing
#PASSTYPE - A (read set), B (read)






#TEMPORARY TAKE DAMAGE SOUND
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 2



#LOG
tellraw @a ["",{"selector":"@s"},{"text":" just healed "},{"score":{"name":"inflict.health","objective":"var"}}, {"text":" from player "}, {"score":{"name":"inflict.source","objective":"var"}}]
