
#built in handling of list actions (prev/next page)

#display list
data modify storage cmd:var display.list set from storage cmd:var selection.item.tag.list
data modify storage cmd:var display.items set from storage cmd:var selection.item.tag.list.displayitems
execute store result score display.list.page var run data get storage cmd:var selection.item.tag.list.page
function cmd:boxmenu/display/list/run
