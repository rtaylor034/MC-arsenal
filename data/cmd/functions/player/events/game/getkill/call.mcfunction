
#CALL - from events/game/die/call
#DESC - called by a player when they get a kill

#PASS - (getkill.killed -> var) | killed playerid
#PASSTYPE - (read)

#NOTE - this player has the "killer" tag




#TRACKER EXTRACT tdata
function cmd:player/tracker/findextract/run

#TRACKER STATISTICS
#add damage
execute store result score val var run data get storage cmd:var tdata.game.statistics.rounds[0].kills
scoreboard players add val var 1
execute store result storage cmd:var tdata.game.statistics.rounds[0].kills int 1 run scoreboard players get val var


#LOG
tellraw @a ["",{"selector":"@s"}, {"text":" just killed "},{"score":{"name":"getkill.killed","objective":"var"}}]





#RESETS
scoreboard players reset getkill.killed var
function cmd:player/tracker/unfindinject/run
scoreboard players reset val var
