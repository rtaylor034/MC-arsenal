
#Runs ready check

function cmd:player/game/ready/check/run
execute if score check.success var matches 1 run function cmd:player/game/ready/set/ready
execute unless score check.success var matches 1 run function cmd:player/game/ready/set/invalidready
