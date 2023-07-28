
#IN - A [cmd:var -> get.sub.descarr] | desc array
#OUT - AFFECTS [cmd:var -> get.item.tag.display.Lore]

#DESC - appends the desc array specified in [A] to {OUT}.

execute if data storage cmd:var get.sub.descarr[] run function cmd:ability/item/get/sub/descadd/foreachdesc


#RESETS
data remove storage cmd:var get.sub.descarr
