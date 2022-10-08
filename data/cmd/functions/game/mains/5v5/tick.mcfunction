#CALL - game/events/5v5/game/start/call
#[Recursive]

#DESC - called every tick while a game is running





#MAINS
execute if score phase GAME matches 3 run function cmd:game/mains/5v5/overtime/main




#RECUR
schedule function cmd:game/mains/5v5/tick 1t replace
