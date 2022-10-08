
#CALL - events/game/die/death
#DESC - Called to check if a team has won (no players left on other teams) (Only on GAME mode 1)

#check if only 1 team is alive
#(playerstate of this player is currently 2)
execute as @p[scores={playerstate=1},tag=ingame] run scoreboard players operation winteam var = @s team
execute as @a[scores={playerstate=1},tag=ingame] unless score @s team = winteam var run scoreboard players set winteam var 0

#EVENT CALL: 5v5/game/round/end (conditional)
execute unless score winteam var matches 0 run function cmd:game/events/5v5/round/end/call

#RESETS
scoreboard players reset winteam var
