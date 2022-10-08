
#IN - A [display.list.items -> cmd:var = Array<Item Obj>], B [display.list.xspace -> cmd:var = Array<int>], C [display.list.yspace -> cmd:var = Array<int>], D (display.list.page -> var) | item list, x indicies to occupy, y indicies to occupy, page of list to display
#IN OPT - e [display.list.itemtag -> cmd:var = NBT], f [display.list.nextPageSlot -> cmd:var = byte], g [display.list.prevPageSlot -> cmd:var = byte] | list items tags, next page arrow slot, previous page arrow slot
#OUT - (display.list.pagesleft -> var) | number of pages left

#USE - displays items in this box by filling up the x and y indicies specified by (IN B) and (IN C) with items from (IN A). the selection of items to display from (IN A) depend on the page specified by (IN D), starting at 0. will additionally merge data from (IN e) to all items item tag. (OUT) returns (IN D) subtracted from how many pages this list has in total, so how many pages there are left in this list, given you are on page (IN D) *returns 0 if the next page has 0 items*. this process will automatically create next page and previous page items at slots (IN f) and (IN g) if specified.

# ==== SPACE EXPLANATION ====
#each element in (IN B) and (IN C) correspond to a row or column in the box menu.
# (IN B) or xspace, can contain numbers 0-8, non repeating. this corresponds with the columns of the boxmenu
# (IN C) or yspace, can contain numbers 0-2, non repeating. this corresponds with the rows of the boxmenu
# for each item slot in the boxmenu, if its column matches an element in (IN B), and row matches an element in (IN C), then an item in (IN A) will be placed in that slot.

#slot chart:
# OO x0 x1 x2 x3 x4 x5 x6 x7 x8
# y0 -- -- -- -- -- -- -- -- --
# y1 -- -- -- -- -- -- -- -- --
# y2 -- -- -- -- -- -- -- -- --

#NOTE - (IN D) specifies which "page" of items is displayed. the first <x> elements after index (IN D)*<x> of (IN A) will be displayed. where <x> is the amount of items that can fit in the space specified by (IN B) and (IN C). <x> is already calculated in this process.
#NOTE - The order of (IN B) and (IN C) affect the order in which items are displayed. it is recommended to sort the elements of (IN B) and (IN C) in ascending order for expected results.

# ==== EXAMPLE ====
# (IN A) has 50 items
# (IN B) is [0, 2, 4, 6, 8]
# (IN C) is [0, 2]
# (IN D) is 0
# the boxmenu would look like this:
# 0 - 1 - 2 - 3 - 4
# - - - - - - - - -
# 5 - 6 - 7 - 8 - 9
# where each number corresponds to the index of the item in (IN A), and each "-" is blank space.
# if (IN D) were to change to 2, it would look like this:
# 20 - 21 - 22 - 23 - 24
# -- - -- - -- - -- - --
# 25 - 26 - 27 - 28 - 29

#NOTE - (IN f) and (IN g) create working next page and previous page buttons without any need to code anything for them. this is handled directly be selection events.

#NOTE - (IN A) should NOT specify slots
#NOTE - This process calls display/run, and merges (IN) values. do NOT call display/run after calling this process, just set the (IN) value for display/run, and call this process.
#NOTE - this process resets (IN) values after running


#out init
data modify storage cmd:var display.list.out set value []

#store var (for referencing IN values in their original form)
data modify storage cmd:var display.store set from storage cmd:var display

#TOTAL SLOTS
execute store result score display.list.rows var if data storage cmd:var display.list.yspace[]
execute store result score display.list.cols var if data storage cmd:var display.list.xspace[]
scoreboard players operation display.list.totalslots var = display.list.rows var
scoreboard players operation display.list.totalslots var *= display.list.cols var


#PAGE OFFSET
#removes page*totalslots elements from the front of [display.list.items -> cmd:var]
scoreboard players operation display.list.offset var = display.list.page var
scoreboard players operation display.list.offset var *= display.list.totalslots var
execute if score display.list.offset var matches 1.. run function cmd:boxmenu/display/list/pageoffset

#MAIN FOREACH LOOP
#foreach row/y
execute if score display.list.rows var matches 1.. run function cmd:boxmenu/display/list/foreachrow

#OUT SET (pages left)
execute store result score display.list.temp var store result score display.list.pagesleft var if data storage cmd:var display.list.items[]
scoreboard players operation display.list.pagesleft var /= display.list.totalslots var
scoreboard players operation display.list.temp var %= display.list.totalslots var
execute if score display.list.temp var matches 1.. run scoreboard players add display.list.pagesleft var 1

#page arrows
#these are added directly to [display.items -> cmd:var]
execute if data storage cmd:var display.list.prevPageSlot if score display.list.page var matches 1.. run function cmd:boxmenu/display/list/prevarrow
execute if data storage cmd:var display.list.nextPageSlot if score display.list.pagesleft var matches 1.. run function cmd:boxmenu/display/list/nextarrow




#DISPLAY
data modify storage cmd:var display.items append from storage cmd:var display.list.out[]
function cmd:boxmenu/display/run





#RESETS
scoreboard players reset display.list.page var
scoreboard players reset display.list.rows var
scoreboard players reset display.list.cols var
scoreboard players reset display.list.slot var
scoreboard players reset display.list.temp var
scoreboard players reset display.list.offset var
scoreboard players reset display.list.totalslots var
scoreboard players reset display.list.x var
scoreboard players reset display.list.y var
