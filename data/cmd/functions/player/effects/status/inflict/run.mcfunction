
#IN - @s, A [inflict.name -> cmd:var = String], B (inflict.time -> var), C (inflict.type -> var), D (inflict.source -> var) | effect name/identifier, effect duration, effect type, source playerid
#IN OPT - e [inflict.params -> cmd:var = Obj], f (inflict.stack -> var) | custom params, is stackable?
#IN ALT - @s, A [inflict.effect -> cmd:var = Effect Obj], (IN e) | Effect object
#OUT - N/A
#USE - Adds a status effect to the effect.status[] array on this players marker. This will run the effect function corresponding with the effect name specified in (IN A), for (IN B) ticks. Some status effects may require custom params, specify these in (IN e). (IN C) specifies if this is benifecial, detrimental, or neutral for the player. if (in f) is 1, this effect will not check for duplicates and multiple effect objects with the same name will be able to exist in a players effect array.

#NOTE - Call this process from the player gaining the effect.
#NOTE - This process should be used for *ANY AND ALL* status effects REGARDLESS of case.
#NOTE - All this process does is add an effect object in the marker array that has the name specified in (IN A) with a timer. This does NOT check whether (IN A) is a valid effect, as it just stores (IN A) as a string.
#NOTE - this process resets input values after calling
#NOTE - (IN ALT) can be specified and can contain the entire effect object to be added, but it MUST follow the effect object template *not including inflict:1b*. This will override any (IN) inputs.

#NOTE - types are for specifying is this effect beneficial or detrimental or neither to the player. examples: Stunned (Negative), Invulnerable (Positive), Channeling (Neutral)

#TYPE KEY
#0 = Neutral
#1 = Negative
#2 = Positive
#3 = Special

#find tracker
function cmd:player/tracker/find/run

#manip var
data modify storage cmd:var effects set from entity @e[type=minecraft:marker,tag=track,limit=1,sort=nearest] data.effects.status

#template
data modify storage cmd:var effect set value {name:"",time:0,params:{},inflict:1b,type:0,source:0}

#set effect values
data modify storage cmd:var effect.name set from storage cmd:var inflict.name
execute store result storage cmd:var effect.time int 1 run scoreboard players get inflict.time var
data modify storage cmd:var effect.params set from storage cmd:var inflict.params
data modify storage cmd:var effect.type set from storage cmd:var inflict.type
execute if data storage cmd:var inflict.effect run data modify storage cmd:var effect merge from storage cmd:var inflict.effect
execute store result storage cmd:var effect.source int 1 run scoreboard players get inflict.source var

#EVENT CALL: effect/oninflict
function cmd:player/events/effects/status/oninflict/call

#DUPLICATE CHECK
scoreboard players set dupetime var 0
data modify storage cmd:process/array/cycleto array set from storage cmd:var effects
data modify storage cmd:process/array/cycleto tag.name set from storage cmd:var effect.name
function cmd:process/array/cycleto/run
data modify storage cmd:var effects set from storage cmd:process/array/cycleto out

#MODIFY EFFECT ARRAY
#if there is a duplicate, check whether the effect trying to be inflicted has a greater "time" value, if it does, replace the duplicate effect, if it does not, do nothing.
#if there is no duplicate, or this effect is stackable, just prepend the inflicted effect to the effects array.
execute if score inflict.stack var matches 1 run scoreboard players set cycleto.out var 0
execute if score cycleto.out var matches 1 store result score dupetime var run data get storage cmd:var effects[0].time
execute if score cycleto.out var matches 1 if score dupetime var < inflict.time var run data modify storage cmd:var effects[0] set from storage cmd:var effect
execute if score cycleto.out var matches 0 run data modify storage cmd:var effects prepend from storage cmd:var effect

#set manip var back to tracker
data modify entity @e[type=minecraft:marker,tag=track,limit=1] data.effects.status set from storage cmd:var effects


#RESETS
function cmd:player/tracker/unfind/run
data remove storage cmd:var effect
data remove storage cmd:var effects
data remove storage cmd:var inflict.name
data remove storage cmd:var inflict.params
scoreboard players reset inflict.time var
scoreboard players reset dupetime var
data remove storage cmd:var inflict.effect
scoreboard players reset inflict.stack
