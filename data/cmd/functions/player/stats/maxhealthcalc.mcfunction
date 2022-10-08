#Calculates the strength to melee stats

#control get
execute store result score maxnum var run data get storage cmd:controls/stats maxHealth.multiplier.numerator
execute store result score maxdiv var run data get storage cmd:controls/stats maxHealth.multiplier.denominator

#base
execute store result score @s max_health run data get storage cmd:controls/stats maxHealth.base

#mult calc
scoreboard players operation temp var = @s stat_health
scoreboard players operation temp var *= maxnum var
scoreboard players operation temp var /= maxdiv var
scoreboard players operation @s max_health += temp var




#RESETS
scoreboard players reset temp var
scoreboard players reset dmgnum var
scoreboard players reset dmgdiv var
