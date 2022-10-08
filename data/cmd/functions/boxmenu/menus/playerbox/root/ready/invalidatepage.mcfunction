
#CALL - root/select
#DESC - invalidates all selections on the entire page (this is so ready players cannot change things)


data modify storage cmd:process/array/mergetoall array set from storage cmd:var display.items
data modify storage cmd:process/array/mergetoall tag.tag.menu.tags.invalid set value 1
data modify storage cmd:process/array/mergetoall tag.tag.Enchantments append value {lvl:1,id:"UNSELECTABLE"}
data modify storage cmd:process/array/mergetoall exception.tag.menu.tags.invalid set value 1
function cmd:process/array/mergetoall/run
data modify storage cmd:var display.items set from storage cmd:process/array/mergetoall out
