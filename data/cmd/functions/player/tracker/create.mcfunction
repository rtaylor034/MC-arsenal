
#CALL - firstjoin
#DESC - creates a new tracker for this player and kills old tracker
#NOTE - this really should never have to be called past firstjoin, as trackers should never die. but maybe call it for safety at the start of games.


#destroy old tracker
function cmd:player/tracker/find/run
kill @e[type=minecraft:marker,tag=track]

#CREATE
summon marker 0 1 0 {Tags:["tracker","init"], data:{game:{}, passives:{armor:[],weapon:0},bars:[],effects:{stat:[],status:[]}, abilities:[{wait:-1,slot:1,time:0}, {wait:-1,slot:2,time:0}, {wait:-1,slot:3,time:0}, {wait:-1,slot:4,time:0}], consumables:[{slot:1},{slot:2},{slot:3},{slot:4}]}}

#playerid transfer
scoreboard players operation @e[type=minecraft:marker,tag=init] playerid = @s playerid

#head/uuid data
setblock 0 0 0 minecraft:barrel
loot replace block 0 0 0 container.0 loot cmd:player/head

function cmd:player/tracker/find/run
data modify entity @e[type=marker,tag=track,limit=1,sort=nearest] data.playerName set from block 0 0 0 Items[0].tag.SkullOwner.Name
data modify entity @e[type=marker,tag=track,limit=1,sort=nearest] data.UUID set from entity @s UUID

function cmd:player/tracker/unfind/run
setblock 0 0 0 minecraft:oak_sign

#RESETS
scoreboard players reset id var
tag @e[type=minecraft:marker] remove init
