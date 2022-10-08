
#CALL - events/5v5/round/end
#PASS - A (winningteam -> var) | team that won
#PASSTYPE - (read)
#CONTEXT - Console

#DESC - Called when the game ends (A team won the game).

#/TBI

scoreboard players set mode GAME 0
function cmd:game/landmarks/basespawns/clear/run
function cmd:game/landmarks/playercells/clear/run
tag @a remove ingame
scoreboard players set @a playerstate 0
clear @a

tp @a 0 100 0

#/CAN BE REMOVED LATER, FOR DEV
schedule clear cmd:game/mains/5v5/sectick
schedule clear cmd:game/mains/5v5/tick
