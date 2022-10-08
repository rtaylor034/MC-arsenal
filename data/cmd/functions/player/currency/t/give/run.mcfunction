
#IN - @s, (give.amount -> var) | amount
#OUT - (give.out -> var) | amount after

#USE - use this process to give this player an amount of t currency.

#NOTE - does NOT reset [IN].

#DEVNOTE - this is here for expandability, probably will add some sort of item inventory display and currency limit in the future, but for now its extremely simple.

#score
scoreboard players operation @s currency_t += give.amount var
scoreboard players operation give.out var = @s currency_t


#MESSAGE
execute if score give.amount var matches 0.. run tellraw @s ["",{"text":"> ","color":"dark_green"},{"text":"Bank: ","color":"gray"},{"score":{"name":"@s","objective":"currency_t"},"italic":true,"color":"aqua"},{"text":"t","italic":true,"color":"aqua"},{"text":" (","color":"green"},{"text":"+","color":"green"},{"score":{"name":"give.amount","objective":"var"},"italic":false,"color":"green"},{"text":")","color":"green"}]
execute unless score give.amount var matches 0.. run tellraw @s ["",{"text":"> ","color":"dark_green"},{"text":"Bank: ","color":"gray"},{"score":{"name":"@s","objective":"currency_t"},"italic":true,"color":"aqua"},{"text":"t","italic":true,"color":"aqua"},{"text":" (","color":"red"},{"score":{"name":"give.amount","objective":"var"},"italic":false,"color":"red"},{"text":")","color":"red"}]

#RESETS
#scoreboard players reset give.amount var
