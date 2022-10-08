#called from @a
#player/main


#PLAYERSTATES
execute as @s[scores={playerstate=0}] run function cmd:player/playerstates/lobby
execute as @s[scores={playerstate=1}] run function cmd:player/playerstates/ingame/alive
execute as @s[scores={playerstate=3}] run function cmd:player/playerstates/ingame/midphase
