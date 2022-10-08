
#DESC - designated for all controls regarding maps, notably the main map array.
#IMPORTANT NOTE - make sure to not have any duplicate "id" keys in any array.






#MAIN MAP ARRAY
#Main array that contains information about all maps.
#"id" is map id, should be unique.
#"name" is the display name of the map.
#"devName" is the developer name of the map
# "centerPos" specifies the center coordinate of the map (arbitrary height) (double values)
#"cellLocations" is an array containing location objects for each team's playercell locations. "team" specifies the team, while "pos" specifies where the playercells are generated in coordinates (double values).
#"baseSpawn" is the same as "cellLocations" but for where the players will spawn at the beginning of the round (at the players base). "offset" specifies the offset between each player when they spawn.
data modify storage cmd:controls/maps array set value []

#Test Map
data modify storage cmd:controls/maps array append value {id:1,name:"Test Map",devName:"test_map",centerPos:[1000d,100d,0d]}
data modify storage cmd:controls/maps array[0].cellLocations set value [{team:1,pos:[1000d,100d,-60d]},{team:2,pos:[1000d,100d,60d]}]
data modify storage cmd:controls/maps array[0].baseSpawns set value {offset:[1d,0d,0d],locations:[{team:1,pos:[1000d,56d,-43d]},{team:2,pos:[1000d,56d,43d]}]}
