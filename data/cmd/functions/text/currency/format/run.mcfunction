
#IN - (format.number -> var), B (format.type -> var) | currency amount, currency type
#OUT - A [format.text -> cmd:var ; JsonText] | formatted text
#USE - converts the number specified in [A] to properly formatted text to fit the style of the currency.

#TYPE KEY
#1 - c
#2 - t

#EX: [A] = 100, [B] = 2 ; [OUT A] = '{"text":"100t","color":"aqua","italic":"true"}'

execute if score format.type var matches 1 run data modify block 0 0 0 front_text.messages[0] set value '[{"score":{"name":"format.number","objective":"var"},"color":"gold","bold":false,"italic":true},{"text":"c","color":"gold","bold":false,"italic":true}]'
execute if score format.type var matches 2 run data modify block 0 0 0 front_text.messages[0] set value '[{"score":{"name":"format.number","objective":"var"},"color":"aqua","bold":false,"italic":true},{"text":"t","color":"aqua","bold":false,"italic":true}]'

data modify storage cmd:var format.text set from block 0 0 0 front_text.messages[0]








#RESETS
scoreboard players reset format.number var
scoreboard players reset format.type var
