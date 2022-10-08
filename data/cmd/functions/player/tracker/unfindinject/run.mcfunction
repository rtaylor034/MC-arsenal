
#IN - (@s -> playerid), A [tdata -> cmd:var ; NBT data] | playerid, data to inject
#OUT - N/A
#USE - Unfinds this player's tracker and sets its data to [A].

#NOTE - Used in tandem with "tracker/findextract".

data modify entity @e[type=marker,tag=track,limit=1,sort=nearest] data set from storage cmd:var tdata
function cmd:player/tracker/unfind/run

data remove storage cmd:var tdata
