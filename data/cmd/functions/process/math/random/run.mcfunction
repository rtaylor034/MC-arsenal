
#PARAMS - A (random.max -> var = 32767) | max
#OUT - (random.number -> var) | random number
#CONTEXT - N/A

#USE - sets {OUT} to a random number between 0 and [A]

#NOTE - It is highly recommended not to set [A] to values higher than 32767. (2^15 - 1).

#RESET OUT
scoreboard players set random.maxbit var 32767

execute if score random.max var matches 1.. run scoreboard players add random.max var 1

scoreboard players set random.number var 0
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 1
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 2
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 4
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 8
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 16
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 32
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 64
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 128
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 256
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 512
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 1024
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 2048
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 4096
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 8192
execute if predicate cmd:math/halfchance run scoreboard players add random.number var 16384

#removed to prevent overflow
#execute if predicate cmd:math/halfchance run scoreboard players add random.number var 32768
#execute if predicate cmd:math/halfchance run scoreboard players add random.number var 65536

execute if score random.max var matches 1.. run scoreboard players operation random.number var *= random.max var
execute if score random.max var matches 1.. run scoreboard players operation random.number var /= random.maxbit var



#FOR DEV CHECKING VALUE
#tellraw @a {"score":{"name":"random.number","objective":"var"}}

#RESETS
scoreboard players reset random.max var
scoreboard players reset random.maxbit var
