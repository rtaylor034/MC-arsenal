#CALL - game/events/5v5/game/start/call
#[Recursive]

#DESC - called every second while a game is running


#TIMER
execute if score ticking GAME matches 1 run scoreboard players remove timer GAME 1

#MAINS
execute if score phase GAME matches 1 run function cmd:game/mains/5v5/prepare/secmain
execute if score phase GAME matches 2 run function cmd:game/mains/5v5/fight/secmain


#RECUR
schedule function cmd:game/mains/5v5/sectick 1s replace

tellraw @a ["",{"score":{"name":"timer","objective":"GAME"}}]
