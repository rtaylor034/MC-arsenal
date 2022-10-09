
#CALL - game/start/call
#PASS - A [round -> game:var : int] | round number
#PASSTYPE - (read, set)
#CONTEXT - Console

#DESC - Called to start the next round in a 5v5 standard game (from in-game)

#new round tracker statistics
execute as @e[type=marker,tag=tracker] run data modify entity @s data.game.statistics.rounds prepend value {round:0, dmgDealt:0, dmgTaken:0, kills:0}
scoreboard players add round GAME 1
execute as @e[type=marker,tag=tracker] store result entity @s data.game.statistics.rounds[0].round int 1 run scoreboard players get round GAME

#preparation phase
function cmd:game/events/5v5/phase/prepare/call

#START TICKING
function cmd:game/mains/5v5/tick
function cmd:game/mains/5v5/sectick
