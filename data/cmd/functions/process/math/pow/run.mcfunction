
#IN - A (pow.num -> var), B (pow.exp -> var) | number, exponent
#OUT - (pow.out -> var) | output

#DESC - raises [A] to the [B]th power and returns to [OUT].

#NOTE - only works for positive [B] values (obviously)

scoreboard players operation pow.out var = pow.num var
execute if score pow.exp var matches 2.. run function cmd:process/math/pow/mult


#RESETS
scoreboard players reset pow.num var
scoreboard players reset pow.exp var
