
#CALL - player/events/game/die/checkwin
#PASS - A (round -> GAME), B (winteam -> var)| round number, winning team id
#PASSTYPE - A (read, set), B (read)
#CONTEXT - Console

#DESC - Called to end the round in a 5v5 standard game (from in-game). Distributes ending rewards and starts the next round.

#/TODO: distribute currency rewards

#GAME DATA
#LOG
tellraw @a ["",{"score":{"name":"winteam","objective":"var"}}, {"text":" just won, moving to round "},{"score":{"name":"round","objective":"GAME"}}]

#add win
execute if score winteam var matches 1 run scoreboard players add wins_blue 1
execute if score winteam var matches 2 run scoreboard players add wins_red 1

execute store result score maxwins var run data get storage cmd:controls/game 5v5.roundWinsRequired
execute if score wins_blue GAME >= maxwins var run scoreboard players set teamGameWon var 1
execute if score wins_red GAME >= maxwins var run scoreboard players set teamGameWon var 2

#EVENT CALL: events/5v5/game/end/call
#(If a team has won the game)
execute if score teamGameWon var matches 1.. run function cmd:game/events/5v5/game/end/call

#/simulates delay, probably do a short intermission before starting the next round.\
schedule clear cmd:game/mains/5v5/sectick
schedule clear cmd:game/mains/5v5/tick
execute unless score teamGameWon var matches 1.. run schedule function cmd:game/events/5v5/round/start/call 5s replace

#RESETS
scoreboard players reset teamGameWon var
scoreboard players reset maxwins var
