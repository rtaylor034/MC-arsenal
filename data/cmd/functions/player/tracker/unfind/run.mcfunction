
#IN - (@s -> playerid) | playerid
#OUT - N/A
#USE - Removes "track" from this players tracker, should be called once in the same function after tracker/find/run has been called

# # # # # NEVER EVER REMOVE "track" TAG MANUALLY, PLEASE USE THIS FUNCTION # # # # #

#NOTE - Call this function instead of simply removing the "track" tag at the end of a function. Using this prevents tracker find stack complications.
#NOTE - IMPORTANT - This process **ABSOLUTELY MUST** be used EXACTLY ONCE every time tracker/find/run has been called in the same function.
#NOTE - IMPORTANT - **DO NOT** remove the "track" tag manually or tamper with the (trackcount -> @s) score. This could lead to extreme issues.

scoreboard players operation trackfind.id var = @s playerid
execute as @e[type=minecraft:marker,tag=tracker] if score @s playerid = trackfind.id var run scoreboard players remove @s trackcount 1
tag @e[type=marker,tag=track,scores={trackcount=..0}] remove track

scoreboard players reset trackfind.id var
