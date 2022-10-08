
#CALL - use/success/trackerdata


data modify storage cmd:var array[0].wait set from storage cmd:var array[0].uses[1].maxWait
execute unless data storage cmd:var array[0].uses[1].maxWait run data modify storage cmd:var array[0].wait set value -1
