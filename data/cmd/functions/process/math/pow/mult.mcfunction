
#decriment
scoreboard players remove pow.exp var 1

scoreboard players operation pow.out var *= pow.num var


#LOOP
execute if score pow.exp var matches 2.. run function cmd:process/math/pow/mult
