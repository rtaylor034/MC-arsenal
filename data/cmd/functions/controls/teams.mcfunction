
#DESC - designated for all controls regarding teams

#TEAM KEY (score)
#-1 - not in game/lobby
#0 - spectator
#1 - team 1
#2 - team 2
#3 - ffa




#create teams
team add ingame-team1
team add ingame-team2

team modify ingame-team1 seeFriendlyInvisibles true
team modify ingame-team1 friendlyFire false
team modify ingame-team1 nametagVisibility never
team modify ingame-team1 collisionRule always
team modify ingame-team1 deathMessageVisibility never

team modify ingame-team2 seeFriendlyInvisibles true
team modify ingame-team2 friendlyFire false
team modify ingame-team2 nametagVisibility never
team modify ingame-team2 collisionRule always
team modify ingame-team2 deathMessageVisibility never
