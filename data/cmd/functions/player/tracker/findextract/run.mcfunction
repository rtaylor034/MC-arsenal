
#IN - (@s -> playerid) | playerid
#OUT - [tdata -> cmd:var ; NBT data] | Tracker data
#USE - Finds this players tracker via "tracker/find", and then stores its data in [OUT].

#NOTE - This method finds this players tracker and does NOT unfind it, unfind must be done in the same tick.
#NOTE - Use "tracker/unfindinject" to inject the modified [OUT] back into this players tracker.
#NOTE - Multi-call safe (Will not overwrite [OUT] if it has not been injected yet).

function cmd:player/tracker/find/run
execute unless data storage cmd:var tdata run data modify storage cmd:var tdata set from entity @e[type=marker,tag=track,limit=1,sort=nearest] data
