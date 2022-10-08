
#IN - @s, A (modify.stat -> var), B1 (modify.set -> var), B2 (modify.add -> var) | stat id, value to set, value to add
#OUT - (modify.out -> var), | stat modifier score after change

#USE - Standard process to call for modifying the stats of the player. changes the "stat_<stat>_mod" corresponding with the stat id specified in (IN A) based on (IN B).

#NOTE - This is mainly a process used for stat effects, and probably should not be ran otherwise.
#NOTE - Call this process from the player that has their stats being modified
#NOTE - input (IN B1) OR (IN B2), no need to set both. (IN B1) sets the stat mod value, while (B2) adds to the players existing stat mod value.
#NOTE - it is HIGHLY recommended to not use (IN B1). should only use in very controlled cases.


#STAT IDS
#1 - Power
#2 - Protection
#3 - Vitality
#4 - Movement Speed
#5 - Focus
#6 - Strength

execute if score modify.set var matches -999999.. run function cmd:player/stats/modify/set
execute if score modify.add var matches -999999.. run function cmd:player/stats/modify/add

#TAG
tag @s add statupdate

#OUT
function cmd:player/stats/modify/out


#RESETS
scoreboard players reset modify.stat var
scoreboard players reset modify.set var
scoreboard players reset modify.add var
