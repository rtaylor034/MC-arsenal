
#CALL - systems/effects/status/foreacheffect
#FROM - The player with an effect
#DESC - This function runs all of the check functions for all effects. Any status effects need their check function to be called from this function.
#PASS - A (effects.time -> var), B [e -> cmd:var = Obj] | A current effect duration, B current effect object and reference to [effects.status[0] -> cmd:var]
#PASSTYPE - A (read), B (read, set)

#NOTE - duplicate the template command and the folder when creating a new effect
#NOTE - even though (PASS B) is (read, set), the only thing that should realistically be changed/set is "e.params" if the effect has any.

#CHECK VAR
scoreboard players set check var 1

#checks
#(copy this)
#execute if score check var matches 1 run function cmd:player/effects/status/<effect name>/check
execute if score check var matches 1 run function cmd:player/effects/status/effect/template/check
execute if score check var matches 1 run function cmd:player/effects/status/effect/shield/check
