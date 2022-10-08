
#from equipped

#TAGS
data modify storage cmd:var display.list.items[0].tag.menu.playerbox set value {s1:2}
data modify storage cmd:var display.list.items[0].tag.menu.tags.invalid set value 1

#BUTTON

#sign parse
data modify storage cmd:var display.list.items[0].tag.display.Lore prepend value '{"text":"X BANNED X","italic":false,"bold":true,"color":"dark_red"}'
