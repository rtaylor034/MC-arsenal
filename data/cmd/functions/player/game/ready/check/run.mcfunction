
#IN - @s
#OUT - (check.success -> var) | can be ready

#USE - sets [OUT] to 1 if this player is valid to be ready (all abilities are equipped). 0 if not.

#Ready states
#0 - Not ready
#1 - Ready

scoreboard players set check.success var 1

#sets valid to 0 if the player has any open ability slots
function cmd:player/tracker/findextract/run
execute if data storage cmd:var tdata.abilities[] run function cmd:player/game/ready/check/foreachability

#RESETS
data remove storage cmd:var tdata
function cmd:player/tracker/unfind/run
