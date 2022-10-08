
#CALL - use/success/trackerdata


data modify storage cmd:var array[0].time set from storage cmd:var array[0].uses[0].cooldown

#[DEPRICATED]
#Cycle cooldown
#data modify storage cmd:var array[0].cooldown append from storage cmd:var array[0].use[0].cooldown
#data remove storage cmd:var array[0].use[0].cooldown
