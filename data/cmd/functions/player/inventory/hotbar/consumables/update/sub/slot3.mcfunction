

#base item
execute if score get.success var matches 1 run item replace entity @s hotbar.3 with carrot_on_a_stick{customtags:{hotbar:3,consumableslot:3}}
execute unless score get.success var matches 1 run item replace entity @s hotbar.3 with black_dye{customtags:{hotbar:3,consumableslot:3}}

#nbt merge
item modify entity @s hotbar.3 cmd:mergenbt
