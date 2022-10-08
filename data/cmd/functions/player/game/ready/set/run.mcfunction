
#IN - @s, A (set.ready -> var) | ready state
#OUT - A (set.success -> var) | success?

#USE - Sets (prep_ready -> @s) to [A] and does proper notifying. If [A] is 1, this does the proper checks if this player can be ready (if they have all ability slots equipped). [OUT A] is set to 1 if the ready state was changed, 0 if not.

#Ready states
#0 - Not ready
#1 - Ready

scoreboard players set set.success var 1
execute if score set.ready var matches 1.. run function cmd:player/game/ready/set/check
execute if score set.ready var matches 0 run function cmd:player/game/ready/set/unready

execute unless score @s prep_ready = set.ready var run scoreboard players set set.success var 0

#CALLTO: game/mains/5v5/prepare/allready
execute if score mode GAME matches 1 unless entity @a[scores={prep_ready=0,playerstate=3},tag=ingame] run function cmd:game/mains/5v5/prepare/allready

#RESETS
scoreboard players reset set.ready var
