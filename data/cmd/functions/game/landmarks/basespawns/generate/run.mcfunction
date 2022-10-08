
#IN - A [generate.offset -> cmd:var ; Array[3]<double>], B [generate.locations -> cmd:var ; Array<Obj>] | player offset, Location Objects
#OUT - N/A
#DESC - generates marker locations based on the baseSpawn data specified in [A].

#Location Object - {team:<int>,pos:[<double>,<double>,<double>]}
#NOTE - the "team" tag specifies the team that the player spawn markers generated at the corresponding location are for.

#EX: [A] = [1d,0d,0d], [B] = [{team:1,pos:[0d,0d,100d]},{team:2,pos:[0d,0d,-100d]}]
#In this case, team 1's player spawns will be centered around 0 0 100, and each player will be 1 block apart in the x direction. this differs from playercell generation, as the position specified in [B] is the center of the generation, not where it starts.
#*IMPORTANT* NOTE - Do NOT have multiple elements in [B] that have the same "team" value.
#NOTE - it is recommended that you do not put negative values in [A], as it will do the same thing, but might just cause unnecassary problems.

#force load chunks (rough estimate)

#for each team (uses element removal)
execute if data storage cmd:var generate.locations[] run function cmd:game/landmarks/basespawns/generate/foreachteam






#RESETS
scoreboard players reset generate.i var
scoreboard players reset generate.team var
data remove storage cmd:var generate
scoreboard players reset generate.startpos.x
scoreboard players reset generate.startpos.y
scoreboard players reset generate.startpos.z
scoreboard players reset generate.startpos.sx
scoreboard players reset generate.startpos.sy
scoreboard players reset generate.startpos.sz
scoreboard players reset generate.startpos.mult
scoreboard players reset generate.placerpos.x
scoreboard players reset generate.placerpos.y
scoreboard players reset generate.placerpos.z
scoreboard players reset generate.offset.x
scoreboard players reset generate.offset.y
scoreboard players reset generate.offset.z
