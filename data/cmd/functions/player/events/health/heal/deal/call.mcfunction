
#CALL - from health/heal/inflict/run
#DESC - called by a player when they are a source of healing

#PASS - A (heal.target -> var), B (inflict.health -> var) | A playerid of target, B amount of healing
#PASSTYPE - A (read), B (read, set)

#NOTE - this player has the "heal-source" tag
#NOTE - this called right before event/health/heal/take is called, and passes all (PASS) vars to it.


#TAG TARGET "damage-target"
execute as @a if score @s playerid = heal.target var run tag @s add heal-target




#DEV LOG
tellraw @a ["",{"selector":"@s"}, {"text":" just healed "},{"score":{"name":"inflict.health","objective":"var"}}, {"text":" to player "}, {"score":{"name":"heal.target","objective":"var"}}]


#TEMPORARY SOUND
playsound minecraft:block.note_block.bell master @s ~ ~ ~ 1 2


#RESETS
scoreboard players reset heal.target var
tag @a remove heal-target
