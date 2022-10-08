
data modify storage cmd:var generate.locations set from storage cmd:controls/maps array[0].cellLocations
function cmd:game/landmarks/playercells/generate/run

data modify storage cmd:var generate set from storage cmd:controls/maps array[0].baseSpawn
function cmd:game/landmarks/basespawns/generate/run
