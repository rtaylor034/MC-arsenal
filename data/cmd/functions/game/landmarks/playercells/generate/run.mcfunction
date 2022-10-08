
#IN - A [generate.locations -> cmd:var ; Array<Obj>] | location Object array
#OUT - N/A
#DESC - generates playercell structures and places location markers based on the locations given in [A]. starts at "pos" position, and generates playercells in the positive x direction.

#Location Object - {team:<int>,pos:[<double>,<double>,<double>]}
#NOTE - the "team" tag specifies the team that the playerboxes generated at the corresponding location are for.

#EX: [A] = [{team:1,pos:[0d,0d,0d]},{team:2,pos:[0d,100d,0d]}]
#in this case, team 1's playercells will generate at 0 0 0, and team 2's playercells will generate at 0 100 0. players on any other team will not have playercells generated.
#*IMPORTANT* NOTE - Do NOT have multiple elements in [A] that have the same "team" value.

#NOTE - playercells will always generate in the positive x direction from the specified initial position in [A]

#for each team (uses element removal)
execute if data storage cmd:var generate.locations[] run function cmd:game/landmarks/playercells/generate/foreachteam








#RESETS
scoreboard players reset generate.i var
scoreboard players reset generate.team var
data remove storage cmd:var generate
