

scoreboard players remove dev.generateabilities.id var 1




data modify storage cmd:controls/abilities array prepend value {id:0, type:0, devName:"generated", name:"Placeholder Ability", uses:[{primary:1,cooldown:0, energyCost:0}]}

execute store result storage cmd:controls/abilities array[0].id int 1 run scoreboard players get dev.generateabilities.id var
execute store result storage cmd:controls/abilities array[0].name int 1 run scoreboard players get dev.generateabilities.id var

scoreboard players set random.max var 4
function cmd:process/math/random/run
scoreboard players add random.number var 1
execute store result storage cmd:controls/abilities array[0].type int 1 run scoreboard players get random.number var

scoreboard players set random.max var 600
function cmd:process/math/random/run
execute store result storage cmd:controls/abilities array[0].uses[0].cooldown int 1 run scoreboard players get random.number var

scoreboard players set random.max var 100
function cmd:process/math/random/run
execute store result storage cmd:controls/abilities array[0].uses[0].energyCost int 1 run scoreboard players get random.number var

execute if score dev.generateabilities.id var matches -50.. run function cmd:dev/placeholders/generateabilities
