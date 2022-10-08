
#CALL - from events/ability/use/call
#DESC - for any commands or functions that modify the player's tracker's ability array

#ref var
data modify storage cmd:var array set from storage cmd:var abilities

#cooldown
function cmd:player/events/ability/use/success/cooldown

#energy cost
function cmd:player/events/ability/use/success/energycost

#Wait time
function cmd:player/events/ability/use/success/wait


#cycle use
data modify storage cmd:var array[0].uses append from storage cmd:var array[0].uses[0]
data remove storage cmd:var array[0].uses[0]


#set data back to tracker
data modify entity @e[type=minecraft:marker,tag=track,limit=1] data.abilities set from storage cmd:var array


#RESETS
data remove storage cmd:var array
