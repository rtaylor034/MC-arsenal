
#AFFECTS inflict.dmg

#dmg mult = f / f+p

#VAR SETS
#Mult factor (f)
#(protection required to make damage multiplier .5) (the higher the value, the less effective armor is)
scoreboard players set f var 100

#protection stat
scoreboard players operation p var = @s stat_prot

#precision
scoreboard players set M var 10000

#CALCULATE
#numerator
scoreboard players operation n var = f var
scoreboard players operation n var *= M var

#denominator
scoreboard players operation p var += f var

#divide
scoreboard players operation n var /= p var


#MULTIPLY
scoreboard players operation inflict.dmg var *= n var
scoreboard players operation inflict.dmg var /= M var


#RESET
scoreboard players reset f var
scoreboard players reset p var
scoreboard players reset M var
scoreboard players reset n var
