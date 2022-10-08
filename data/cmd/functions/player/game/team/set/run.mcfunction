
#IN - @s, A (set.team -> var) | team id
#OUT - A (set.success -> var) | success?

#USE - sets this player to the team specified in (IN A). If the player is not already on that team, (OUT A) will be 1, if they are, (OUT A) will be 0.

#TEAM KEY
#-1 - no team/out of game
#0 - spectator
#1 - team 1
#2 - team 2

execute store result score set.success var run scoreboard players operation @s team = set.team var

team leave @s
execute if score set.team var matches 1 run team join ingame-team1
execute if score set.team var matches 2 run team join ingame-team2
