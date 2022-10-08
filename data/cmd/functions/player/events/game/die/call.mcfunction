
#CALL - events/health/zero/call
#DESC - called by a player when they die (reach 0 health)

#PASS - A (inflict.source -> var), B (inflict.killed -> var) | killer playerid, did die?
#PASSTYPE - A (read), B (set)


#/just an idea: For ~2 seconds after a player dies, their armor is still visible (but they have invisibility and can't move). During this time, their armor peices are one by one replaced with chain armor, and then one by one removed from thier body until they are completely not visible, in which they completely die and the "death animation" is over.
#/Like thier disitigrating or de-rezzing like tron xd.

#PASS B SET
scoreboard players set inflict.killed var 1

#death confirmed
execute if score inflict.killed var matches 1.. run function cmd:player/events/game/die/death
