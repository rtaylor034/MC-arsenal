

# ==== CHANGE THIS TO THE EFFECT NAME/IDENTIFIER ====
data modify storage cmd:var check set value "shield"


#IF YOUR EFFECT REQUIRES PARAMS SPECIFY THEM HERE
#[<param name> = <type>] refers to: [e.params.<param name> -> cmd:var = <type>]

#PARAMS - [amount = Int] | Shield amount



#CHECK IF NAME MATCHES
execute store success score check var run data modify storage cmd:var check set from storage cmd:var e.name


#==== CHANGE THESE FUNCTION PATHS TO THE NAME OF THE EFFECT ====
#RUN EFFECT
#inflict
execute if score check var matches 0 if data storage cmd:var e.inflict run function cmd:player/effects/status/effect/shield/inflict
#tick
execute if score check var matches 0 run function cmd:player/effects/status/effect/shield/tick
#zero
execute if score check var matches 0 if score effects.time var matches ..0 run function cmd:player/effects/status/effect/shield/zero
