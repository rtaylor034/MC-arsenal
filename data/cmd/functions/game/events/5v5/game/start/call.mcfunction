
#CALL - MANUAL
#PASS - A (start.map -> var) | map ID
#PASSTYPE - (read)
#CONTEXT - Console

#DESC - Called to start a 5v5 standard game (from lobby)

#/IMPORTANT - Map chunks must be loaded before calling!!

#== GAME DATA KEYS ==
#MODE
#1 - 5v5

#PHASE
#1 - prepare/buy
#2 - gameplay
#3 - overtime/sudden death
#4 - post-game

#GAME DATA SET
#these initialize all used (GAME) values. initialize all used values even if they dont technically need to be initialized for organization sake.
scoreboard players set round GAME 0
scoreboard players set mode GAME 1
scoreboard players set wins_blue GAME 0
scoreboard players set wins_red GAME 0
scoreboard players set timer GAME 0
scoreboard players set ticking GAME 0
scoreboard players set phase GAME 0

#TAG PLAYERS (MUST HAVE)
tag @a[scores={team=1..2}] add ingame

#SCORES
scoreboard players set @a[tag=ingame] currency_c 0
scoreboard players set @a[tag=ingame] currency_t 0

#Creates trackers
#/This is for test-refresh purposes and does not need to exist in final build
execute as @a[tag=ingame] at @s run function cmd:player/tracker/create

#ARMOR ARRAY
data modify storage cmd:storage/armor array set value []
execute as @a[tag=ingame] at @s run function cmd:player/armor/array/registerplayer/run

#BARS ARRAY
data modify storage cmd:storage/bars array set value []
execute as @a[tag=ingame] at @s run function cmd:player/bars/array/registerplayer/run

#PARSE ARMOR
function cmd:player/armor/array/parse/run
execute as @a[tag=ingame] at @s run function cmd:player/armor/applystats/run

#CYCLE MAP
data modify storage cmd:process/array/cycleto array set from storage cmd:controls/maps array
execute store result storage cmd:process/array/cycleto tag.id int 1 run scoreboard players get start.map var
function cmd:process/array/cycleto/run
data modify storage cmd:var start.mapData set from storage cmd:process/array/cycleto out[0]

#CLEAR LANDMARKS
function cmd:game/landmarks/basespawns/clear/run
function cmd:game/landmarks/playercells/clear/run

#GENERATE PLAYER CELLS
data modify storage cmd:var generate.locations set from storage cmd:var start.mapData.cellLocations
function cmd:game/landmarks/playercells/generate/run

#INIT ALL BOXES
function cmd:boxmenu/menus/playerbox/initall/call

#GENERATE BASESPAWNS
data modify storage cmd:var generate.locations set from storage cmd:var start.mapData.baseSpawns.locations
data modify storage cmd:var generate.offset set from storage cmd:var start.mapData.baseSpawns.offset
function cmd:game/landmarks/basespawns/generate/run

#ROUND START
function cmd:game/events/5v5/round/start/call


#RESETS
scoreboard players reset start.map var
data remove storage cmd:var start
