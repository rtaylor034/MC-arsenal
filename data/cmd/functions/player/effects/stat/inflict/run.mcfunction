
#IN - @s, A (inflict.id -> var), B (inflict.amount -> var), C (inflict.time -> var), D (inflict.source -> var) | stat id, change amount, effect duration, source playerid
#OUT - N/A
#USE - Adds an stat effect to the effect.stat[] array on this players marker. This changes the players stat_<stat>_mod score specified in (IN A), by (IN B), for (IN C) ticks.

#NOTE - Call this process from the player gaining the effect.
#NOTE - This process should be used for *ANY AND ALL* stat effects REGARDLESS of case.
#NOTE - this process does NOT actually apply the stats, this process just adds the effect to the tracker's effect array, it is then handled by effect systems.
#NOTE - this process does NOT reset input values after calling

#stat id key:
#1 = Power
#2 = Protection
#3 = Vitality
#4 = Movement Speed
#5 = Focus
#6 = Strength
#7 = Weapon Damage
#8 = Weapon Attack Speed
#9 = Weapon Max Energy

#template
data modify storage cmd:var effect set value {id:0,time:0,amount:0,inflict:1b,source:0}

#set values
execute store result storage cmd:var effect.id int 1 run scoreboard players get inflict.id var
execute store result storage cmd:var effect.time int 1 run scoreboard players get inflict.time var
execute store result storage cmd:var effect.amount int 1 run scoreboard players get inflict.amount var
execute store result storage cmd:var effect.source int 1 run scoreboard players get inflict.source var

#EVENT CALL: effects/stat/oninflict
function cmd:player/events/effects/stat/oninflict/call


#insert into tracker
function cmd:player/tracker/find/run
data modify entity @e[type=minecraft:marker,tag=track,limit=1] data.effects.stat prepend from storage cmd:var effect


#RESETS
function cmd:player/tracker/unfind/run
data remove storage cmd:var effect
