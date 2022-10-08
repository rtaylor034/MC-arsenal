

#base item
execute if score get.success var matches 1 run item replace entity @s hotbar.2 with carrot_on_a_stick{customtags:{hotbar:2,consumableslot:2}}
execute unless score get.success var matches 1 run item replace entity @s hotbar.2 with black_dye{customtags:{hotbar:2,consumableslot:2}}

#nbt merge
item modify entity @s hotbar.2 cmd:mergenbt
